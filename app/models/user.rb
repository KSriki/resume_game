class User < ApplicationRecord
  has_many :positions
  has_many :educations
  has_many :companies, through: :positions
  has_many :industries, through: :companies
  has_many :institutions, through: :educations

  has_secure_password
  accepts_nested_attributes_for :companies, :educations, :positions, :institutions

  validates :password, length: {in: 10..16, message: "length should be between 10-16 characters"}
  validates :password, format: { without: /\s/, message: "excludes all whitespace" }
  validates :username, format: { without: /\s/, message: "excludes all whitespace" }
  validates :username, uniqueness: true
  validates :fullname, format: { with: /\A[\w\s]+\z/, message: "only allows letters" }
end
