class Industry < ApplicationRecord
  has_many :companies

  # before_validation :remove_whitespace
  validates :field, format: { with: /\A[\w\s]+\z/, message: "only allows letters" }

    # def remove_whitespace
    #     self.field.chomp!
    # end

end
