class EducationsController < ApplicationController
before_action :current_user

  def new
    inst1 = Institution.new(institution_name: "")
    @education = Education.new(start_date: Date.today, end_date: Date.today, institution: inst1, degree: "", user: @user)
  end

  def create
    @education = Education.new(education_params)
    @education.user_id = @user.id
    if @education.save
      redirect_to @user
    else
      render "new"
    end
  end

private

  def education_params
      params.require(:education).permit(:degree,
      :start_date,
      :end_date,
      :institution_name)
  end

end
