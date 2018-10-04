class User < ApplicationRecord
  has_many :positions
  has_many :educations
  has_many :companies, through: :positions
  has_many :industries, through: :companies

  has_many :institutions, through: :educations

  has_secure_password
  accepts_nested_attributes_for :positions, :educations

  validates :password, length: {in: 10..16, message: "length should be between 10-16 characters"}, :if => :password
  validates :password, format: { without: /\s/, message: "excludes all whitespace" }, :if => :password
  validates :username, format: { without: /\s/, message: "excludes all whitespace" }, :if => :username
  validates :username, uniqueness: true, :if => :username
  validates :fullname, format: { with: /\A[\w\s]+\z/, message: "only allows letters" }

##### Analytics Methods #####
  def split_name
    names_array = self.fullname.split(' ')
    return {first_name: names_array[0], last_name: names_array[1]}
  end



##### Form Methods #####
  # Updates object and makes associations for the nested data for educations recieved from user params
  def educations_attributes=(educations_attributes)

    # Supposed to delete the association between user and its educations
      self.educations.clear


      educations_attributes.values.each do |educations_attribute|

          educations_attribute = fix_dates(educations_attribute)
          name = educations_attribute[:institution_name]
          inst = Institution.find_or_create_by(institution_name: name)
          educations_attribute.delete(:institution_name)
          educations_attribute[:institution_id] = inst.id

         education = Education.find_or_create_by(educations_attribute)
        self.educations << education
      end
    end

    def positions_attributes=(positions_attributes)
        positions_attributes.values.each do |positions_attribute|
          byebug
          positions_attribute = fix_dates(positions_attribute)
          industry = Industry.find_or_create_by(id: positions_attribute[:company_attributes][:industry])
          company = Company.find_or_create_by(positions_attribute[:company_attributes]["1"])
          position = Position.find_or_create_by(positions_attribute)
          self.positions << position
        end
    end


    def fix_dates(att)
        start_date = Date.new att["start_date(1i)"].to_i, att["start_date(2i)"].to_i, att["start_date(3i)"].to_i
        att.delete("start_date(1i)")
        att.delete("start_date(2i)")
        att.delete("start_date(3i)")
        att[:start_date] = start_date

        end_date = Date.new att["end_date(1i)"].to_i, att["end_date(2i)"].to_i, att["end_date(3i)"].to_i
        att.delete("end_date(1i)")
        att.delete("end_date(2i)")
        att.delete("end_date(3i)")
        att[:end_date] = end_date
        return att
    end




end
