class ConversationsController < ApplicationController

  #filter
  before_filter :authenticate_user!

  layout false

  # assigning existing conversation if present otherwise create new
  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    render json: { conversation_id: @conversation.id }
  end

  # fetching all messages of conversation
  def show
    @conversation = Conversation.find(params[:id])
    @reciever = interlocutor(@conversation)
    @messages = @conversation.messages
    @message = Message.new
  end

  private

  # permitting conversation parameters
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  # returning reciever
  def interlocutor(conversation)
    current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end
end
