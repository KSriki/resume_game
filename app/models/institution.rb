class Institution < ApplicationRecord
  has_many :educations
  has_many :users, through: :educations

  # before_validation :remove_whitespace
  validates :institution_name, format: { with: /\A[\w\s]+\z/, message: "only allows letters" }

  # def remove_whitespace
  #     self.institution_name.chomp!
  # end


end
