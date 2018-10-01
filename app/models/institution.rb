class Institution < ApplicationRecord
  has_many :educations
  has_many :users, through: :educations

  validates :institution_name, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
