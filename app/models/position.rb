class Position < ApplicationRecord
  belongs_to :user
  belongs_to :institution

  validates :title, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :description, length: { minimum: 40 }
end
