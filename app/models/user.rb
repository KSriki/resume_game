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





end
