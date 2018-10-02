class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy] # Will not work if params do not include [:id]

  def index
    @users = User.all
  end

  def new
    @user = User.new # Should #find_or_create_by() be used here instead?
  end

  def show
  end

  def create
      @user = User.create(user_params())
      byebug
      if @user.save
          redirect_to user_url(@user)
      else
          render :new
      end
  end


private

  def user_params(*args)
    params.require(:users).permit(*args) # Should accepts_nested_attributes be included here for all other user info?
  end

  def find_user
    @user = User.find(params[:id])
  end
end
