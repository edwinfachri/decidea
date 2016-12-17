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
      if sender?
        create_notification_sender @message_user
      else
        create_notification_recipient @message_user
      end
      redirect_to message_user_messages_path(@message_user)
    end
  end

  private
    def message_params
      params.require(:message).permit(:subject, :body, :user_id)
    end

    def create_notification_sender(message_user)
      Notification.create!(user_id: message_user.recipient_id,
                          notified_by_id: current_user.id,
                          identifier: message_user.id,
                          notice_type: 5
                          )
    end

    def create_notification_recipient(message_user)
      Notification.create!(user_id: message_user.sender_id,
                          notified_by_id: current_user.id,
                          identifier: message_user.id,
                          notice_type: 5
                          )
    end

    def sender?
      current_user.id == @message_user.sender_id
    end
end
