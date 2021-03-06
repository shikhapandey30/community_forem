class GroupsController < ApplicationController

  # filters
  before_filter :authenticate_user!
  before_action :set_group, only: [:show, :edit, :update, :destroy, :leave, :join]
  include NotificationsHelper

  # fetching all group and members and fetching groups and members on basis of search data
  def index
    if params[:data].present?
      @groups = (current_user.groups.search(params[:data]) + current_user.group_members.search(params[:data])).compact.uniq.sort_by(&:updated_at).reverse
    else
      @groups = (current_user.groups + current_user.group_members).compact.uniq.sort_by(&:updated_at).reverse
    end
  end

  # fetching post, suggested groups, communitites
  def show
    if params[:post_id]
      @post = current_user.posts.friendly.find(params[:post_id])
      @post.upload
    else
      @post = Post.new
      @post.build_upload
    end
    @suggested_communities = new_suggested_communities.first(2)
    @suggested_connections = new_suggested_connections.first(2)
    @suggested_groups = new_suggested_groups.first(2)
    @posts = @group.posts.order("updated_at desc").paginate(:page => params[:page], :per_page => 5)
    @comment = Comment.new    
  end

  # Initializing group
  def new
    @group = Group.new
    @group.build_upload
    @users = User.all
    @users = @users - [current_user]
  end

  # editing group
  def edit
    authorize @group
    @group.upload.present? ? @group.upload : @group.build_upload
    @users = User.all
    @users = @users - [current_user]
  end

  # creating group
  def create
    @group = current_user.groups.new(group_params)
    respond_to do |format|
      if @group.save      
        set_members if params[:group][:members].present?         
        format.html { redirect_to @group, notice: 'Group is successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        @users = User.all
        @users = @users - [current_user]
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # updating group
  def update
    authorize @group
    respond_to do |format|
      if @group.update(group_params)
        set_upload
        set_members if params[:group][:members].present? 
        format.html { redirect_to @group, notice: 'Group is successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        @users = User.all
        @users = @users - [current_user]
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # deleting group
  def destroy
    authorize @group
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group is successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # leaving the group by user
  def leave  
    members = @group.members.where(:user_id=> current_user.id)
    members.delete_all
    flash[:notice] = 'Group is successfully Leaved.'
    redirect_to '/dashboard'
  end

  # joining the group and sending the notification of joining
  def join
    @group.members.create(:user_id=>current_user.id)
    @invitable_members = @group.members - @group.members.where(user_id: current_user.id)    
    @invitable_members.map(&:user).uniq.each do |user|
      reciver =  User.find(user)
      notifications = reciver.notifications.unread 
      Notification.create(recepient: user, user: current_user, body: "#{current_user.screen_name } has join #{@group.topic}", notificable: @group, :accept => true)
      PrivatePub.publish_to "/profiles/new_#{user.id}", "jQuery('#all-notifications').html('#{notifications.count}'); jQuery('#all-notifications').addClass('push-notification');"
    end    
    if request.referrer.include?("followings")
      @suggest=false
    else    
      @suggested_groups, @suggest = suggested_groups
    end
    
    respond_to do |format|
      format.js
      format.html { redirect_to groups_url }
    end
  end

  # searching group on basis of topic passed
  def filter    
    @suggested_groups = Group.where(id: new_suggested_groups).by_topic(params[:topic])
    @suggest = false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_params
       params.require(:group).permit(:category_id, :topic, :headline, :slogan, :community_logo, :description, upload_attributes: [:id, :image, :site_link, :file, :video, :_destroy])
    end

    # updaiting image and file
    def set_upload
      @group.upload.update_column(:image, nil) if params[:image_url].eql?("true")
      @group.upload.update_column(:file, nil) if params[:file_url].eql?("true")
    end

    # member creation and sending invitation to join group
    def set_members
      members_ids = params[:group][:members].reject(&:empty?)
      @group.members.destroy_all if params[:action] == "update"
      members_ids.each do |members_id|
        member = Member.create(:user_id => members_id.to_i, :invitable => @group)
        #send notification
        reciver =  User.find(members_id)
        notifications = reciver.notifications.unread 
        if reciver.notification_setting.try(:new_update)
          Notification.create(recepient_id: members_id, user: current_user, body: "#{current_user.screen_name } has invited you to join a group #{@group.topic} ", notificable: @group, :accept => false, :is_acceptable=>true)
          PrivatePub.publish_to "/profiles/new_#{members_id}", "jQuery('#all-notifications').html('#{notifications.count}'); jQuery('#all-notifications').addClass('push-notification');"
        end
      end
    end

    # fetching suggested groups
    def suggested_groups
      if request.headers["HTTP_REFERER"].include?("suggested_groups")
        @suggested_groups = new_suggested_groups
        @suggest =  false
      else
        @suggested_groups = new_suggested_groups.first(2)
        @suggest =  true
      end
      return @suggested_groups, @suggest
    end
end
