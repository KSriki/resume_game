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
      redirect_to "/users/#{@user.id}/resume_form"
    end
  end

  def create
      @user = User.new(user_params(:password, :password_confirmation, :fullname, :username))
      byebug
      if @user.save
          redirect_to @user
      else
          flash[:notice] = "There was an error with your account creation"
          render :new
      end
  end

  def edit

  end

  def update
    # Add update to add peeps


    # byebug
    @user.update(user_params(
        :educations_attributes =>
            [
                :degree,
                :start_date,
                :end_date,
                :institution_name
            ],
        :positions_attributes =>
            [
                :title,
                :description,
                :start_date,
                :end_date,
                :company_attributes =>
                [
                    :company_name,
                    :sector,
                    :size,
                    :industry
                ]
            ]
            )
        )
        # byebug
        if @user.save
            redirect_to @user
        else
            render "resume_form"
        end



  end

  def resume_form

      # refractor split into 2 ifs/methods
     if !@user.educations.any?
        inst1 = Institution.new(institution_name: "")
        @user.educations.build(start_date: Date.today, end_date: Date.today, institution: inst1, degree: "")

    end

     if !@user.positions.any?
         ind1 = Industry.new(field: "")
         company1 = Company.new(company_name: "", size: "", sector: "", industry: ind1)
         @user.positions.build(title: "", description: "", start_date: Date.today, end_date: Date.today, company: company1)
     end
  end

private

  def user_params(*args)
    params.require(:user).permit(*args) # Should accepts_nested_attributes be included here for all other user info?
  end

end
