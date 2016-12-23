class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include SessionsHelper

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def commenter
      @user = User.find_by(id: params[:user_id])
      redirect_to(root_url) unless current_user?(@user)
    end

end
