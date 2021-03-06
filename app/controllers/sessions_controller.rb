class SessionsController < ApplicationController

  def homepage
    if session[:user_id]
        @logged_in = true
        @user = User.find_by(id: session[:user_id])
    end
    render :layout => 'homepage'
  end

  def new
    if session[:user_id]
        @logged_in = true
    end
  end

  #login
  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "No user found" # What does flash do?
      render :new
    end
  end

  #logout
  def logout
    session.clear
    render :layout => 'logout'
  end

end
