class UsersController < ApplicationController

  before_action :current_user, only: [:show, :edit, :update, :destroy, :resume_form] # Will not work if params do not include [:id]


  def index
    @users = User.all
  end

  def new
    @user = User.new # Should #find_or_create_by() be used here instead?
  end

  def show
    if @user.educations.empty?
      redirect_to 'resume_form'
    end
  end

  def create
      @user = User.new(user_params(:password, :password_confirmation, :fullname, :username))
      # byebug
      if @user.save
          redirect_to user_url(@user)
      else
          flash[:notice] = "There was an error with your account creation"
          render :new
      end
  end

  def edit

  end

  def update
    # Add update to add peeps
    byebug
  end

  def resume_form
    inst1 = Institution.new(institution_name: "")
    @user.educations.build(start_date: Date.today, end_date: Date.today, institution: inst1, degree: "")
    ind1 = Industry.new(field: "")
    company1 = Company.new(company_name: "", size: "", sector: "", industry: ind1)
    @user.positions.build(title: "", description: "", start_date: Date.today, end_date: Date.today, company: company1)
  end

private

  def user_params(*args)
    params.require(:user).permit(*args) # Should accepts_nested_attributes be included here for all other user info?
  end

end
