class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :edit, :update, :destroy, :join, :leave]

  # GET /communities
  # GET /communities.json
  def index
    # @communities = current_user.communities
    # start change code- kandarp
    if params[:search].present?
      @communities = Community.search(params[:search])
    else
      @communities =(current_user.communities + current_user.community_members).compact
    end
    # end change code- kandarp
    # @communities =(current_user.communities + current_user.community_members).compact
    @friends = current_user.my_friends
    @friends = @friends.present? ? @friends : []
    # @suggested_communities = 
  end

  # GET /communities/1
  # GET /communities/1.json
  def show
    @posts = @community.posts.paginate(:page => params[:page], :per_page => 15)
    @comment = Comment.new
    @post = Post.new
    @post.build_upload
  end

  # GET /communities/new
  def new
    @community = Community.new
    @community.build_upload
    @friends = current_user.my_friends
    @friends = @friends.present? ? @friends : []
  end

  # GET /communities/1/edit
  def edit
    @community.upload.present? ? @community.upload : @community.build_upload
    @friends = current_user.my_friends
    @friends = @friends.present? ? @friends : []
  end

  # POST /communities
  # POST /communities.json
  def create
    @community = current_user.communities.new(community_params)
    respond_to do |format|
      if @community.save
        if params[:community][:members].present?
          members_ids = params[:community][:members].reject(&:empty?)
          members_ids.each do |members_id|
            member = Member.create(:user_id => members_id.to_i, :invitable => @community)

            #send notification
            Notification.create(recepient_id: members_id, user: current_user, body: "#{current_user.screen_name } has invited you to join a community #{@community.headline} ", notificable: @community, :accept => false)

          end
        end
        format.html { redirect_to @community, notice: 'Community is successfully created.' }
        format.json { render :show, status: :created, location: @community }
      else
        format.html { render :new }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communities/1
  # PATCH/PUT /communities/1.json
  def update
    respond_to do |format|
      if @community.update(community_params)
        set_upload
        if params[:community][:members].present?
            @community.members.destroy_all
          members_ids = params[:community][:members].reject(&:empty?)
          members_ids.each do |members_id|
            member = Member.create(:user_id => members_id.to_i, :invitable => @community)
            #send notification
           notification = Notification.create(recepient_id: members_id.to_i, user: current_user, body: "#{current_user.screen_name } has has invited you to join a community #{@community.headline} ", notificable: @community, :accept => false)
          end
        end
        format.html { redirect_to @community, notice: 'Community is successfully updated.' }
        format.json { render :show, status: :ok, location: @community }
      else
        format.html { render :edit }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/1
  # DELETE /communities/1.json
  def destroy
    @community.destroy
    respond_to do |format|
      format.html { redirect_to communities_url, notice: 'Community is successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join    
    @community.members.create(:user_id=>current_user.id)
    @invitable_members = @community.members - @community.members.where(user_id: current_user.id)
    @invitable_members.map(&:user).uniq.each do |user|
      Notification.create(recepient: user, user: current_user, body: "#{current_user.screen_name } has join #{@community.topic}", notificable: @community, :accept => true)
    end
    @suggested_communities, @suggest = suggested_communities
  end

  def filter
    @suggested_communities = Community.where(id: new_suggested_communities).by_topic(params[:topic])
    @suggest = false
  end

   def leave  
    members = @community.members.where(:user_id=> current_user.id)
    members.delete_all
    flash[:notice] = 'Group is successfully Leaved.'
    redirect_to '/dashboard'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community
      @community = Community.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_params
      params.require(:community).permit(:category_id, :topic, :headline, :slogan, :community_logo, :description, upload_attributes: [:id, :image, :site_link, :file, :video, :_destroy])
    end

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

    def set_upload
      # @community.upload.destroy
      # @community.build_upload( image: params[:image] )
      # @community.save
      @community.upload.update_column(:image, nil) if params[:image_url].eql?("true")
      @community.upload.update_column(:file, nil) if params[:file_url].eql?("true")
    end
end
