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

  def education_attributes=(educations_attributes)
      educations_attributes.values.each do |education_attribute|
          byebug
          date = Date.new education_attribute["start_date(1i)"].to_i, education_attribute["start_date(2i)"].to_i, education_attribute["start_date(3i)"].to_i
        education = Education.find_or_create_by(education_attribute)
        self.educations << education
      end
    end

    def positions_attributes=(positions_attributes)
        positions_attributes.values.each do |positions_attribute|
            byebug
            start_date = Date.new positions_attribute["start_date(1i)"].to_i, positions_attribute["start_date(2i)"].to_i, positions_attribute["start_date(3i)"].to_i
            positions_attribute.delete("start_date(1i)")
            positions_attribute.delete("start_date(2i)")
            positions_attribute.delete("start_date(3i)")
            positions_attribute[:start_date] = start_date

            end_date = Date.new positions_attribute["end_date(1i)"].to_i, positions_attribute["end_date(2i)"].to_i, positions_attribute["end_date(3i)"].to_i
            positions_attribute.delete("end_date(1i)")
            positions_attribute.delete("end_date(2i)")
            positions_attribute.delete("end_date(3i)")
            positions_attribute[:end_date] = end_date
          position = Position.find_or_create_by(positions_attribute)
          self.positions << position
        end
      end



end
