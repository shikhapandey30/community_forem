class MessagesController < ApplicationController

  #filters
  before_filter :authenticate_user!  
  before_action :get_users, only: [:show, :connection_filter]  
  

  def index
  end

  # fetching friend and messages
  def show    
    @friends = @friends.paginate(:page => params[:page], :per_page => 10)
    @friend = User.friendly.find(params[:conversation_id])    
    @chat_messages = Message.between(current_user, @friend)
    @archive_messages = @chat_messages.archive_messages(current_user)
    @messages = @chat_messages - @archive_messages
    @message = Message.new
    @message.build_upload
    respond_to do |format|
      format.js
      format.html
    end
  end

  # creating message and fetching all messages of conversation between user and friend
  def create
    @message = current_user.messages.create(message_params)
    @friend = User.friendly.find(params[:message][:conversation_id])
    # Notification.create(recepient: @friend, user: current_user, body: "#{current_user.screen_name } message to you ", notificable: @message, :accept => false)

    if @friend.archive.eql?(true)
      @friend.update(archive: false)
      get_users
      @archive="true"
    end
    # @unread_incoming_messages = Message.incoming_messages
    # incoming_messages
    @messages = Message.between(current_user, @friend)
    set_members if params[:message][:recipient_ids].present?
    # conversation_message_path(@friend, current_user)
    # @conversation = Conversation.find(params[:conversation_id])
    # @message = @conversation.messages.build(message_params)
    # @message.user_id = current_user.id
    # @message.save!

    # @path = conversation_path(@conversation)
   # redirect_to :back
  end

  # delete messages
  def destroy
    @friend = User.friendly.find(params[:conversation_id])
    @chat_messages = Message.between(current_user, @friend)
    @archive_messages = @chat_messages.archive_messages(@friend)
    @archive_messages.destroy_all if @archive_messages    
    if @chat_messages.present?
      @chat_messages.archive(current_user)
    end
    @messages = []
    get_users
  end

  # hiding the user and its messages on message page
  # def archive
  #   @user = User.find(params[:conversation_id])
  #   @user.update(archive: true)
  #   get_users
  # end

  def connection_filter
    if params[:name].present?
      @friends = current_user.friends.by_name(params[:name]) + current_user.inverse_friends.by_name(params[:name])
      @friends.delete(current_user)
    end
    @friends = @friends.paginate(:page => params[:page], :per_page => 10)
  end

  def subscription
  end

  private

  # permitting message parameters
  def message_params
    params.require(:message).permit!
  end

  # get unarchive users
  def get_users
    friends = current_user.my_friends
    archive_friends = User.archive
    @friends = friends - archive_friends
    @friends = @friends.uniq
  end

  # sending notification for messages
  def set_members
    members_ids = params[:message][:recipient_ids].reject(&:empty?)
    members_ids.each do |members_id|
      @message = current_user.messages.create(:conversation_id => members_id , :body => params[:message][:body])

      #send notification
      reciver =  User.find(members_id)
      if reciver.notification_setting.try(:new_update)
        Notification.create(recepient_id: members_id, user: current_user, body: "#{current_user.screen_name } has send a message #{@message.topic} ", notificable: @message, :accept => false)
      end
    end
  end

end