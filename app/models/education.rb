class Education < ApplicationRecord
  belongs_to :user
  belongs_to :institution

  # validates start date before end date
  #   end date before today's date
 accepts_nested_attributes_for :institution
  validates :degree, inclusion: {in: %w(highschool bachelor master phd bootcamp trade)}


    def institution_name=(name)
        byebug
        self.institution = Institution.find_or_create_by(institution_name: name)
    end


    def institution_name
        self.institution ? self.institution.institution_name : nil
    end

end
