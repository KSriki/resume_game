class PositionsController < ApplicationController
    before_action :current_user

  def new
      ind1 = Industry.new(field: "")
      company1 = Company.new(company_name: "", size: "", sector: "", industry: ind1)
      @position = Position.new(title: "", description: "", start_date: Date.today, end_date: Date.today, company: company1)
  end

  def create
      @position = Position.new(position_params)
      @position.user_id = @user.id
      if @position.save
          redirect_to @user
      else
          render "new"
      end
  end

  private

  def position_params
      params.require(:position).permit(:title,
      :description,
      :start_date,
      :end_date,
      :company_attributes =>
      [
          :company_name,
          :sector,
          :size,
          :industry
      ])
  end

end
