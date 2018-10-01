class UsersController < ApplicationController

  # before_action :find_user, only: [:update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new # Should #find_or_create_by() be used here instead?
  end

  def create

  end


private

  def user_params
    params.require(:user).permit(:username, :password, :fullname, :id) # Should accepts_nested_attributes be included here for all other user info?
  end

  def find_user
    @user = User.find(user_params[:id])
  end
end
