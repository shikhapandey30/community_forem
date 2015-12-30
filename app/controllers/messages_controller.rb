class MessagesController < ApplicationController
  before_filter :authenticate_user!  
  before_action :get_users, only: [:show, :connection_filter]  
  

  def index
  end

  def show    
    @friends = @friends.paginate(:page => params[:page], :per_page => 10)
    @friend = User.find(params[:conversation_id])
    @messages = Message.between(current_user, @friend)
  end

  def create    
    @message = current_user.messages.create(message_params)
    @friend = User.find(params[:message][:conversation_id])
    @friend.update(archive: false)
    @messages = Message.between(current_user, @friend)
    # conversation_message_path(@friend, current_user)
    # @conversation = Conversation.find(params[:conversation_id])
    # @message = @conversation.messages.build(message_params)
    # @message.user_id = current_user.id
    # @message.save!

    # @path = conversation_path(@conversation)
   # redirect_to :back
  end

  def destroy
    @friend = User.find(params[:conversation_id])
    @messages = Message.between(current_user, @friend)
    @messages.destroy_all if @messages.present?
    redirect_to :back
  end

  def archive
    @user = User.find(params[:conversation_id])
    @user.update(archive: true)
    redirect_to :back
  end

  def connection_filter
    if params[:name].present?
      @friends = current_user.friends.by_name(params[:name]) + current_user.inverse_friends.by_name(params[:name])
      @friends.delete(current_user)
    end
    @friends = @friends.paginate(:page => params[:page], :per_page => 10)
  end

  private

  def message_params
    params.require(:message).permit(:body, :conversation_id)
  end

  def get_users
    friends = current_user.my_friends
    archive_friends = User.archive
    @friends = friends - archive_friends
  end

  
end