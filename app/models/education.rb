class Education < ApplicationRecord
  belongs_to :user
  belongs_to :institution

  # validates start date before end date
  #   end date before today's date

  validates :degree, inclusion: {in: %w(highschool bachelor master phd bootcamp trade)}

end
