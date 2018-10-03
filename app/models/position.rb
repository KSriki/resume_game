class Position < ApplicationRecord
  belongs_to :user
  belongs_to :company

 accepts_nested_attributes_for :company
  validates :title, format: { with: /\A[\w\s]+\z/, message: "only allows letters" }
  validates :description, length: { minimum: 40 }
end
