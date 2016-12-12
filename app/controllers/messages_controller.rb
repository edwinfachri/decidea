class MessagesController < ApplicationController
  before_action do
    @message_user = MessageUser.find(params[:message_user_id])
  end

  def index
    @messages = @message_user.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = @message_user.messages
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true;
      end
    end

    @message = @message_user.messages.new
  end

  def new
    @message = @message_user.messages.new
  end

  def create
    @message = @message_user.messages.new(message_params)
    if @message.save
      redirect_to message_user_messages_path(@message_user)
    end
  end

  private
    def message_params
      params.require(:message).permit(:subject, :body, :user_id)
    end
end
