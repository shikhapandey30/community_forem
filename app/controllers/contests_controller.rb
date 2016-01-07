class ContestsController < ApplicationController

  #filters
  before_action :set_contest, only: [:show, :edit, :update, :destroy, :join, :leave]

  # fetching all contests
  def index
    # start change code- kandarp
    if params[:data].present?
      @contests = Contest.search(params[:data]).order("updated_at desc")
    else
      @contests = Contest.all.order("updated_at desc")
    end
    # end change code- kandarp
    # @contests = Contest.all.order("updated_at desc")
  end

  # fetching contest users
  def show
    # @comment = Comment.new
    @users = @contest.votes.collect(&:user).uniq.sort_by {|u| u.updated_at}.reverse
  end

  # initializing contest
  def new
    @contest = Contest.new
    @contest.build_upload
  end

  # editin contest
  def edit
    authorize @contest
    @contest.upload.present? ? @contest.upload : @contest.build_upload
  end

  # creating contest
  def create
    @contest = current_user.contests.new(contest_params)

    respond_to do |format|
      if @contest.save
        set_upload
        set_members if params[:contest][:members].present? 
        format.html { redirect_to @contest, notice: 'Contest is successfully created.' }
        format.json { render :show, status: :created, location: @contest }
      else
         @users = User.all
         @users = @users - [current_user]
        format.html { render :new }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # uodating contest
  def update
    authorize @contest
    respond_to do |format|
      if @contest.update(contest_params)
        set_upload
        set_members if params[:contest][:members].present?         
        format.html { redirect_to @contest, notice: 'Contest is successfully updated.' }
        format.json { render :show, status: :ok, location: @contest }
      else
        @users = User.all
        @users = @users - [current_user]
        format.html { render :edit }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # deleting contest
  def destroy
    authorize @contest
    @contest.destroy
    respond_to do |format|
      format.html { redirect_to contests_url, notice: 'Contest is successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    @contest.members.create(:user_id=>current_user.id)
    @invitable_members = @contest.members - @contest.members.where(user_id: current_user.id)    
    @invitable_members.map(&:user).uniq.each do |user|
      reciver =  User.find(user.id)
      notifications = reciver.notifications.unread 
      Notification.create(recepient: user, user: current_user, body: "#{current_user.screen_name } has join #{@meeting_room.topic}", notificable: @meeting_room, :accept => true)
      PrivatePub.publish_to "/profiles/new_#{user.id}", "jQuery('#all-notifications').html('#{notifications.count}'); jQuery('#all-notifications').addClass('push-notification');"
    end    
    if request.referrer.include?("followings")
      @suggest=false
    else    
      @suggested_contests, @suggest = suggested_contests
    end
    
    respond_to do |format|
      format.js
      format.html { redirect_to contests_url }
    end
  end
  # leaving contest by member
  def leave  
    members = @contest.members.where(:user_id=> current_user.id)
    members.delete_all
    flash[:notice] = 'Contest is successfully Leaved.'
    redirect_to '/dashboard'
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contest
      @contest = Contest.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contest_params
      # params.require(:contest).permit!
       params.require(:contest).permit(:category_id, :topic, :headline, :slogan, :community_logo, :start_date, :end_date, :description, upload_attributes: [:id, :image, :site_link, :file, :video, :_destroy])

    end

    # updating image and file for contest
    def set_upload
      @contest.upload.update_column(:image, nil) if params[:image_url].eql?("true")
      @contest.upload.update_column(:file, nil) if params[:file_url].eql?("true")
    end

    # creating members and sending notification to join the contest while creating contest
    def set_members
      members_ids = params[:contest][:members].reject(&:empty?)
      @contest.members.destroy_all if params[:action] == "update"
      members_ids.each do |members_id|
        member = Member.create(:user_id => members_id.to_i, :invitable => @contest)
        #send notification
        reciver =  User.find(members_id)
        notifications = reciver.notifications.unread         
        if reciver.notification_setting.try(:new_update)
          Notification.create(recepient_id: members_id, user: current_user, body: "#{current_user.screen_name } has invited you to join a contest #{@contest.topic} ", notificable: @contest, :accept => false, :is_acceptable=>true)
          PrivatePub.publish_to "/profiles/new_#{members_id}", "jQuery('#all-notifications').html('#{notifications.count}'); jQuery('#all-notifications').addClass('push-notification');"

        end
      end
    end

    def suggested_contests
      if request.headers["HTTP_REFERER"].include?("suggested_contests")
        @suggested_contests = new_suggested_contests
        @suggest =  false
      else
        @suggested_contests = new_suggested_contests.first(2)
        @suggest =  true
      end
      return @suggested_contests, @suggest
    end
end
