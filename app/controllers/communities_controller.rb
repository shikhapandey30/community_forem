class CommunitiesController < ApplicationController
  
  #filters
  before_action :set_community, only: [:show, :edit, :update, :destroy, :join, :leave]

  # fetching user communities and associated community members
  def index
    # @communities = current_user.communities
    # start change code- kandarp    
    if params[:data].present?
      @communities = (current_user.communities.search(params[:data]) + current_user.community_members.search(params[:data])).compact.uniq.sort_by(&:updated_at).reverse
    else
      @communities = (current_user.communities + current_user.community_members).compact.uniq.sort_by(&:updated_at).reverse
    end
    # end change code- kandarp
    # @communities =(current_user.communities + current_user.community_members).compact
    @friends = current_user.my_friends
    @friends = @friends.present? ? @friends : [] 
  end

  # Initializing commnunity
  def new
    @community = Community.new
    @community.build_upload
    @friends = current_user.my_friends
    @friends = @friends.present? ? @friends : []
  end

  # editing community
  def edit
    authorize @community
    @community.upload.present? ? @community.upload : @community.build_upload
    @friends = current_user.my_friends
    @friends = @friends.present? ? @friends : []
  end

  # creating community and send invitation to the other members to join
  def create
    @community = current_user.communities.new(community_params)
    respond_to do |format|
      if @community.save
        set_members if params[:community][:members].present?
        format.html { redirect_to @community, notice: 'Community is successfully created.' }
        format.json { render :show, status: :created, location: @community }
      else
        @users = User.all
        @users = @users - [current_user]
        format.html { render :new }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # Updating community
  def update
    authorize @community
    respond_to do |format|
      if @community.update(community_params)
        set_upload
        set_members if params[:community][:members].present?        
        format.html { redirect_to @community, notice: 'Community is successfully updated.' }
        format.json { render :show, status: :ok, location: @community }
      else
        @users = User.all
        @users = @users - [current_user]
        format.html { render :edit }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # fetching posts for a cummunity and all suggested communities, suggested connections and suggested communitys
  def show
    @suggested_communities = new_suggested_communities.first(2)
    @suggested_connections = new_suggested_connections.first(2)
    @suggested_groups = new_suggested_groups.first(2)
    if params[:post_id]
      @post = current_user.posts.friendly.find(params[:post_id])
      @post.upload
    else
      @post = Post.new
      @post.build_upload
    end
    @posts = @community.posts.order("updated_at desc").paginate(:page => params[:page], :per_page => 5)
    @comment = Comment.new    
  end

  # deleting community
  def destroy
    authorize @community
    @community.destroy
    respond_to do |format|
      format.html { redirect_to communities_url, notice: 'Community is successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # joining the community and send notification of joining
  def join    
    @community.members.create(:user_id=>current_user.id)
    @invitable_members = @community.members - @community.members.where(user_id: current_user.id)
    @invitable_members.map(&:user).uniq.each do |user|
      reciver =  User.find(user)
      notifications = reciver.notifications.unread 
      Notification.create(recepient: user, user: current_user, body: "#{current_user.screen_name } has join #{@community.topic}", notificable: @community, :accept => true)
      PrivatePub.publish_to "/profiles/new_#{user.id}", "jQuery('#all-notifications').html('#{notifications.count}'); jQuery('#all-notifications').addClass('push-notification');"
    end
    if request.referrer.include?("followings")
      @suggest=false
    else
      @suggested_communities, @suggest = suggested_communities      
    end
  end

  # suggested communities filter by community topic
  def filter
    @suggested_communities = Community.where(id: new_suggested_communities).by_topic(params[:topic])
    @suggest = false
  end

  # Leaving the community by member
  def leave  
    members = @community.members.where(:user_id=> current_user.id)
    members.delete_all
    flash[:notice] = 'Group is successfully Leaved.'
    redirect_to '/dashboard'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community
      @community = Community.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_params
      params.require(:community).permit(:category_id, :topic, :headline, :slogan, :community_logo, :description, upload_attributes: [:id, :image, :site_link, :file, :video, :_destroy])
    end

    # suggested communities
    def suggested_communities
      if request.headers["HTTP_REFERER"].include?("suggested_communities")
        @suggested_communities = new_suggested_communities
        @suggest =  false
      else
        @suggested_communities = new_suggested_communities.first(2)
        @suggest =  true
      end
      return @suggested_communities, @suggest
    end

    # updating the image for community
    def set_upload
      # @community.upload.destroy
      # @community.build_upload( image: params[:image] )
      # @community.save
      @community.upload.update_column(:image, nil) if params[:image_url].eql?("true")
      @community.upload.update_column(:file, nil) if params[:file_url].eql?("true")
    end

     def set_members
      members_ids = params[:community][:members].reject(&:empty?)
       @community.members.destroy_all if params[:action] == "update"
      members_ids.each do |members_id|
        member = Member.create(:user_id => members_id.to_i, :invitable => @community)
        #send notification
        reciver =  User.find(members_id)
        notifications = reciver.notifications.unread 
        if reciver.notification_setting.try(:new_update)
          Notification.create(recepient_id: members_id, user: current_user, body: "#{current_user.screen_name } has invited you to join a community #{@community.topic} ", notificable: @community, :accept => false, :is_acceptable=>true)
          PrivatePub.publish_to "/profiles/new_#{members_id}", "jQuery('#all-notifications').html('#{notifications.count}'); jQuery('#all-notifications').addClass('push-notification');"
        end
      end
    end
end
