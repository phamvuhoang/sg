class MessagesController < ApplicationController

  def index
    #@user = User.find(params[:user_id])
    @messages = current_user.last_received_messages(10)
  end

  def new
    @recipient = User.find(params[:user_id])
    #@message = current_user.sent_messages.build
    #raise "ERRRRR"
  end

  def create
    #@user = User.find(params[:user_id])
    #@message = @user.sent_messages.build message_params
    
    @recipient = User.find(params[:user_id])
    @message = current_user.sent_messages.build message_params
    @message.recipient = @recipient
    
    #@message = params[:message]
    #@message.recipient = @recipient

    @message.body = params[:message][:body]

    if @message.save
      redirect_to sent_messages_path, notice: 'Message sent!'
    else
      render action: new, notice: 'Unable to send message'
    end
  end

  def show
    @message = Message.find(params[:id])
    if current_user == @message.recipient
      @message.mark_as_read!
    end
  end

  def sent
    @messages = current_user.sent_messages
    render sent_messages_path
  end

  def received
    @messages = current_user.received_messages
    render received_messages_path
  end

  private

  def message_params
    params.require(:message).permit(:recipient_id, :body)
  end

end
