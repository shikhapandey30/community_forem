class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def show
    @friends = current_user.friends + current_user.inverse_friends
    @friends.delete(current_user)
    @friends = @friends.paginate(:page => params[:page], :per_page => 10)
    @friend = User.find(params[:conversation_id])
    # debugger
    @messages = Message.between(current_user, @friend)
  end

  def create    
    @message = current_user.messages.create(message_params)
    @friend = User.find(params[:message][:conversation_id])
    @messages = Message.between(current_user, @friend)
    # conversation_message_path(@friend, current_user)
    # @conversation = Conversation.find(params[:conversation_id])
    # @message = @conversation.messages.build(message_params)
    # @message.user_id = current_user.id
    # @message.save!

    # @path = conversation_path(@conversation)
   # redirect_to :back
  end

  private

  def message_params
    params.require(:message).permit(:body, :conversation_id)
  end
end