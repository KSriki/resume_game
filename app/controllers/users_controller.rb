class UsersController < ApplicationController

  before_action :current_user, only: [:show, :edit, :update, :destroy, :details] # Will not work if params do not include [:id]


  def index
    @users = User.all
  end

  def new
    @user = User.new # Should #find_or_create_by() be used here instead?
  end

  def show
  end

  def create
      @user = User.new(user_params())
      # byebug
      if @user.save
          redirect_to user_url(@user)
      else
          flash[:notice] = "There was an error with your account creation"
          render :new
      end
  end

def details

end

private

  def user_params(*args)
    params.require(:users).permit(*args) # Should accepts_nested_attributes be included here for all other user info?
  end

end
