class Company < ApplicationRecord
  has_many :positions
  has_many :users, through: :positions
  belongs_to :industry

  accepts_nested_attributes_for :industry

  validates :company_name, format: { with: /\A[\w\s]+\z/, message: "only allows letters" }
  validates :size, inclusion: { in: %w(small medium large)}
  validates :sector, inclusion: { in: %w(public private academic)}

  
end
