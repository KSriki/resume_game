class Industry < ApplicationRecord
  has_many :companies

  # before_validation :remove_whitespace
  validates :field, format: { with: /\A[\w\s]+\z/, message: "only allows letters" }

    # def remove_whitespace
    #     self.field.chomp!
    # end

    def self.count_companies
      industries = {}
      Company.all.each do |company|
        industry_sym = company.industry.field.to_sym
        if industries[industry_sym] == nil
          industries[industry_sym] = 1
        else
          industries[industry_sym] += 1
        end
      end
      return industries
    end

end
