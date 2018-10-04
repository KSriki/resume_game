class Position < ApplicationRecord
  belongs_to :user
  belongs_to :company

 accepts_nested_attributes_for :company
  validates :title, format: { with: /\A[\w\s]+\z/, message: "only allows letters" }
  validates :description, length: { minimum: 40 }

  def company_attributes=(company_attributes)
         industry = Industry.find_or_create_by(id: company_attributes[:industry])
         company_attributes[:industry] = industry
        company = Company.find_or_create_by(company_attributes)
        self.company = company
    end

end
