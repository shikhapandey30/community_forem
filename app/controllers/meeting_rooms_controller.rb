class MeetingRoomsController < ApplicationController

  # filters
  before_filter :authenticate_user!
  before_action :set_meeting_room, only: [:show, :edit, :update, :destroy, :leave, :join]

  # fetching meeting rooms by search OR meeting rooms or members for user
  def index
     # start change code- kandarp
    if params[:data].present?
      @meeting_rooms = (current_user.meeting_rooms.search(params[:data]) + current_user.meeting_rooms_members.search(params[:data])).compact.uniq.sort_by(&:updated_at).reverse
    else
      @meeting_rooms =(current_user.meeting_rooms + current_user.meeting_rooms_members).compact.uniq.sort_by(&:updated_at).reverse
    end
    # end change code- kandarp
    # @meeting_rooms =(current_user.meeting_rooms + current_user.meeting_rooms_members).compact
  end

  # meeting room comments
  def show
    @comment = Comment.new
    @comments = @meeting_room.comments
  end

  # initalising meeting room
  def new
    @meeting_room = MeetingRoom.new
    @meeting_room.build_upload
    @users = User.all
    @users = @users - [current_user]
  end

  # edit meeting room
  def edit
    authorize @meeting_room
    @meeting_room.upload.present? ? @meeting_room.upload : @meeting_room.build_upload
    @users = User.all
    @users = @users - [current_user]
  end

  # meeting room creation and sending invitation to user to join
  def create
    @meeting_room = current_user.meeting_rooms.new(meeting_room_params)
    respond_to do |format|
      if @meeting_room.save
        set_members if params[:meeting_room][:members].present?
        format.html { redirect_to @meeting_room, notice: 'Meeting room is successfully created.' }
        format.json { render :show, status: :created, location: @meeting_room }
      else
        @users = User.all
        @users = @users - [current_user]
        format.html { render :new }
        format.json { render json: @meeting_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # updating meeting room and sending notification
  def update
    authorize @meeting_room
    respond_to do |format|
      if @meeting_room.update(meeting_room_params)
        set_upload      
        set_members if params[:meeting_room][:members].present?
        format.html { redirect_to @meeting_room, notice: 'Meeting room is successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting_room }
      else
        @users = User.all
        @users = @users - [current_user]
        format.html { render :edit }
        format.json { render json: @meeting_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # deleting meeting room
  def destroy
    authorize @meeting_room
    @meeting_room.destroy
    respond_to do |format|
      format.html { redirect_to meeting_rooms_url, notice: 'Meeting room is successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # leaving meeting room
  def leave  
    members = @meeting_room.members.where(:user_id=> current_user.id)
    members.delete_all
    flash[:notice] = 'Meeting Room is successfully Leaved.'
    redirect_to '/dashboard'
  end

  def join    
    @meeting_room.members.create(:user_id=>current_user.id)
    @invitable_members = @meeting_room.members - @meeting_room.members.where(user_id: current_user.id)    
    @invitable_members.map(&:user).uniq.each do |user|
      reciver =  User.find(user)
      notifications = reciver.notifications.unread 
      Notification.create(recepient: user, user: current_user, body: "#{current_user.screen_name } has join #{@meeting_room.topic}", notificable: @meeting_room, :accept => true)
      PrivatePub.publish_to "/profiles/new_#{user.id}", "jQuery('#all-notifications').html('#{notifications.count}'); jQuery('#all-notifications').addClass('push-notification');"
    end    
    
    if request.referrer.include?("followings")
      @suggest=false
    else
      @suggested_meeting_rooms, @suggest = suggested_meeting_rooms
    end    
    respond_to do |format|
      format.js
      format.html { redirect_to meeting_rooms_url }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting_room
      @meeting_room = MeetingRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_room_params
       params.require(:meeting_room).permit(:topic, :category_id, :headline, :name, :image, :slogan,upload_attributes: [:id, :site_link, :video, :image, :_destroy])
    end

    # updating image and file for meeting room
    def set_upload
      @meeting_room.upload.update_column(:image, nil) if params[:image_url].eql?("true")
      @meeting_room.upload.update_column(:file, nil) if params[:file_url].eql?("true")
    end

    # suggested communities
    def suggested_meeting_rooms
      if request.headers["HTTP_REFERER"].include?("suggested_meeting_rooms")
        @suggested_meeting_rooms = new_suggested_meeting_rooms
        @suggest =  false
      else
        @suggested_meeting_rooms = new_suggested_meeting_rooms.first(2)
        @suggest =  true
      end
      return @suggested_meeting_rooms, @suggest
    end

    def set_members
      members_ids = params[:meeting_room][:members].reject(&:empty?)
       @meeting_room.members.destroy_all if params[:action] == "update"
      members_ids.each do |members_id|
        member = Member.create(:user_id => members_id.to_i, :invitable => @meeting_room)
        #send notification
        reciver =  User.find(members_id)
        notifications = reciver.notifications.unread         
        if reciver.notification_setting.try(:new_update)
          Notification.create(recepient_id: members_id, user: current_user, body: "#{current_user.screen_name } has invited you to join a meeting_room #{@meeting_room.topic} ", notificable: @meeting_room, :accept => false)
          PrivatePub.publish_to "/profiles/new_#{members_id}", "jQuery('#all-notifications').html('#{notifications.count}'); jQuery('#all-notifications').addClass('push-notification');"          
        end
      end
    end
end
