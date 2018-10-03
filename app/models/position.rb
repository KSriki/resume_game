class Position < ApplicationRecord
  belongs_to :user
  belongs_to :company

 accepts_nested_attributes_for :company
  validates :title, format: { with: /\A[\w\s]+\z/, message: "only allows letters" }
  validates :description, length: { minimum: 40 }

  def company_attributes=(company_attributes)
        self.company = Company.find_or_create_by(company_attributes)

    end

end
