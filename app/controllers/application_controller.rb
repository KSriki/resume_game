class ApplicationController < ActionController::Base

    helper_method :current_user

# It determines whether a user is logged in (ie. has a session[user_id]), and if not, redirects to the login page
  def current_user
    if @user
        @user
    elsif session[:user_id]
        @user = User.find(session[:user_id])
    else
        redirect_to login_path and return
    end
  end
end
