class ApplicationController < ActionController::Base

    helper_method :current_user


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
