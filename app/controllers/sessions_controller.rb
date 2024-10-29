# app/controllers/sessions_controller.rb

class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[new create]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to sign_in_url, alert: "Try again later." }

  def new
    @user = User.new
  end

  def create
    # Use `require` to target nested `:user` params, if form data is structured this way.
    user_params = params.require(:user).permit(:email_address, :password)

    if (user = User.authenticate_by(user_params))
      start_new_session_for user
      redirect_to after_authentication_url, notice: "Logged in with #{user.email_address}"
    else
      flash.now[:alert] = "Try another email address or password."
      redirect_to sign_in_url, status: :unprocessable_entity
    end
  end

  def destroy
    terminate_session
    redirect_to root_url, notice: "You have been signed out."
  end
end
