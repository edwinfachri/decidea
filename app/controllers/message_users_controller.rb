class MessageUsersController < ApplicationController
  def index
    @users = User.all
    @message_users = MessageUser.all
  end

  def create
    if MessageUser.between(params[:sender_id], params[:recipient_id]).present?
      @message_user = MessageUser.between(params[:sender_id],params[:recipient_id]).first
    else
      @message_user = MessageUser.create!(message_user_params)
    end
    redirect_to message_user_messages_path(@message_user)
  end

  private
    def message_user_params
      params.permit(:sender_id, :recipient_id)
    end
end
