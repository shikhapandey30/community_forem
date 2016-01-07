class ForumPollsController < ApplicationController

  #filters
  before_action :set_forum_poll, only: [:show, :edit, :update, :destroy, :join]
  
  # fetching forum poll by search OR all forum poll
  def index
    # start change code- kandarp
    if params[:data].present?
      @forum_polls = ForumPoll.search(params[:data]).order("updated_at desc")
    else
      @forum_polls = ForumPoll.all.order("updated_at desc")
    end
    # end change code- kandarp
    # @forum_polls = ForumPoll.all.order("updated_at desc")
  end

  # fetching forum poll users
  def show    
    @users = @forum_poll.votes.collect(&:user).uniq.sort_by {|u| u.updated_at}.reverse
  	# votes=@forum_poll.votes
  	# user_vote=votes.where(:user_id=>current_user.id,:votable_id=>@forum_poll.id).first if current_user
  	#  if user_vote
   #     @user_vote_type=user_vote.vote_type
  	#  end
  end

  # initializing forum poll
  def new
    @forum_poll= ForumPoll.new
    @forum_poll.build_upload
    @users = User.all
    @users = @users - [current_user]
  end

  # creating forum poll
  def create
    @forum_poll = current_user.forum_polls.new(forum_poll_params)
    respond_to do |format|
      if @forum_poll.save
        set_members if params[:forum_poll][:members].present?
        format.html { redirect_to @forum_poll, notice: 'Forum Poll is successfully created.' }
        format.json { render :show, status: :created, location: @forum_poll }
      else
        @users = User.all
        @users = @users - [current_user]
        format.html { render :new }
        format.json { render json: @forum_poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # editing forum poll
  def edit
    authorize @forum_poll
    @forum_poll.upload.present? ? @forum_poll.upload : @forum_poll.build_upload
    @users = User.all
    @users = @users - [current_user]
  end

  # updating forum poll
  def update
    authorize @forum_poll
    respond_to do |format|
      if @forum_poll.update(forum_poll_params)
        set_upload
         set_members if params[:forum_poll][:members].present?
        format.html { redirect_to dashboard_path, notice: 'Forum Poll is successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        @users = User.all
        @users = @users - [current_user]
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # delete forum poll
  def destroy
    authorize @forum_poll
    @forum_poll.destroy
    respond_to do |format|
      format.html { redirect_to forum_polls_url, notice: 'Forum Poll is successfully destroyed.' }
      format.json { head :no_content }
    end
  end
    # Leaving the community by member
  def leave  
    members = @forum_poll.members.where(:user_id=> current_user.id)
    members.delete_all
    flash[:notice] = 'Forum poll is successfully Leaved.'
    redirect_to '/dashboard'
  end

  def join
    @forum_poll.members.create(:user_id=>current_user.id)
    @invitable_members = @forum_poll.members - @forum_poll.members.where(user_id: current_user.id)    
    @invitable_members.map(&:user).uniq.each do |user|
      reciver =  User.find(user)
      notifications = reciver.notifications.unread 
      Notification.create(recepient: user, user: current_user, body: "#{current_user.screen_name } has join #{@forum_poll.topic}", notificable: @forum_poll, :accept => true)
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

  private
    
    # setting forum poll for all action under this controller
    def set_forum_poll
      @forum_poll= ForumPoll.friendly.find(params[:id])
    end

    #permitting forum polls parameters
    def forum_poll_params
      # params.require(:forum_poll).permit!
       params.require(:forum_poll).permit(:category_id, :topic, :headline, :slogan, :body, :visibility, :end_date, :start_date, :description, upload_attributes: [:id, :image, :site_link, :file, :video, :_destroy])

    end

    # Image updating or not
    def set_upload
      @forum_poll.upload.update_column(:image, nil) if params[:image_url].eql?("true")
      @forum_poll.upload.update_column(:file, nil) if params[:file_url].eql?("true")
    end

    def set_members
      members_ids = params[:forum_poll][:members].reject(&:empty?)
       @forum_poll.members.destroy_all if params[:action] == "update"
      members_ids.each do |members_id|
        member = Member.create(:user_id => members_id.to_i, :invitable => @forum_poll)
        #send notification
        reciver =  User.find(members_id)
        notifications = reciver.notifications.unread         
        if reciver.notification_setting.try(:new_update)
          Notification.create(recepient_id: members_id, user: current_user, body: "#{current_user.screen_name } has invited you to join a forum_poll #{@forum_poll.topic} ", notificable: @forum_poll, :accept => false)
          PrivatePub.publish_to "/profiles/new_#{members_id}", "jQuery('#all-notifications').html('#{notifications.count}'); jQuery('#all-notifications').addClass('push-notification');"
          
        end
      end
    end

    def suggested_forum_polls
      if request.headers["HTTP_REFERER"].include?("suggested_forum_polls")
        @suggested_forum_polls = new_suggested_forum_polls
        @suggest =  false
      else
        @suggested_forum_polls = new_suggested_forum_polls.first(2)
        @suggest =  true
      end
      return @suggested_forum_polls, @suggest
    end
end