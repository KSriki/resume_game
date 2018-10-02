class SessionsController < ApplicationController

  def homepage
    render :layout => 'homepage'
  end

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "No user found" # What does flash do?
      render :new
    end
  end

  def destroy
    session.clear
    render :homepage
  end

end
