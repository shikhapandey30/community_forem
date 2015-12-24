class MeetingRoomsController < ApplicationController
  before_action :set_meeting_room, only: [:show, :edit, :update, :destroy]

  # GET /meeting_rooms
  # GET /meeting_rooms.json
  def index
    @meeting_rooms =(current_user.meeting_rooms + current_user.meeting_rooms_members).compact
  end

  # GET /meeting_rooms/1
  # GET /meeting_rooms/1.json
  def show
    @comment = Comment.new
    @comments = @meeting_room.comments
  end

  # GET /meeting_rooms/new
  def new
    @meeting_room = MeetingRoom.new
    @meeting_room.build_upload
  end

  # GET /meeting_rooms/1/edit
  def edit
    @meeting_room.upload.present? ? @meeting_room.upload : @meeting_room.build_upload
  end

  # POST /meeting_rooms
  # POST /meeting_rooms.json
  def create
    @meeting_room = current_user.meeting_rooms.new(meeting_room_params)
    respond_to do |format|
      if @meeting_room.save
        if params[:meeting_room][:members].present?
          members_ids = params[:meeting_room][:members].reject(&:empty?)
          members_ids.each do |members_id|
          member = Member.create(:user_id => members_id.to_i, :invitable => @meeting_room)
            #send notification
            Notification.create(recepient_id: members_id, user: current_user, body: "#{current_user.screen_name } has invited you to join a meeting rooms #{@meeting_room.topic} ", notificable: @meeting_room, :accept => false)
          end
        end
        format.html { redirect_to @meeting_room, notice: 'Meeting room is successfully created.' }
        format.json { render :show, status: :created, location: @meeting_room }
      else
        format.html { render :new }
        format.json { render json: @meeting_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meeting_rooms/1
  # PATCH/PUT /meeting_rooms/1.json
  def update
    respond_to do |format|
      if @meeting_room.update(meeting_room_params)
        set_upload
      
        if params[:meeting_room][:members].present?
           @meeting_room.members.destroy_all
          members_ids = params[:meeting_room][:members].reject(&:empty?)
          members_ids.each do |members_id|
            member = Member.create(:user_id => members_id.to_i, :invitable => @meeting_room)
            member.save
            #send notification
           notification = Notification.find_or_initialize_by(recepient_id:  members_id.to_i, user: current_user, body: "#{current_user.screen_name } has has invited you to join a meeting_room #{@meeting_room.topic} ", notificable: @meeting_room, :accept => false)
           notification.save
          end
        end
        format.html { redirect_to @meeting_room, notice: 'Meeting room is successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting_room }
      else
        format.html { render :edit }
        format.json { render json: @meeting_room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meeting_rooms/1
  # DELETE /meeting_rooms/1.json
  def destroy
    @meeting_room.destroy
    respond_to do |format|
      format.html { redirect_to meeting_rooms_url, notice: 'Meeting room is successfully destroyed.' }
      format.json { head :no_content }
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

    def set_upload
      @meeting_room.upload.update_column(:image, nil) if params[:image_url].eql?("true")
      @meeting_room.upload.update_column(:file, nil) if params[:file_url].eql?("true")
    end
end
