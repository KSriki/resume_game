class Industry < ApplicationRecord
  has_many :companies

  validates :field, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
