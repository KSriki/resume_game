class Company < ApplicationRecord
  has_many :positions
  has_many :users, through: :positions
  belongs_to :industry

  accepts_nested_attributes_for :industry

  validates :company_name, format: { with: /\A[\w\s]+\z/, message: "only allows letters" }
  validates :size, inclusion: { in: %w(small medium large)}
  validates :sector, inclusion: { in: %w(public private academic)}

  ##### Analytics Methods #####
  ##### Company Count Methods #####

  # Returns an array of company size counts
  def self.count_all_sizes
    return {
      small: Company.count_sizes_small,
      medium: Company.count_sizes_medium,
      large: Company.count_sizes_large
    }
  end

  def self.count_all_sectors
    return {
      public: Company.count_sectors_public,
      private: Company.count_sectors_private,
      academic: Company.count_sectors_academic
    }
  end



private

  # 'Small' here is 1 to 50 employees
  def self.count_sizes_small
    Company.all.select {|company| company.size == "small"}.count
  end

  # 'Medium' here is 51 to 250 employees
  def self.count_sizes_medium
    Company.all.select {|company| company.size == "medium"}.count
  end

  # 'Large' here is 251 or more employees
  def self.count_sizes_large
    Company.all.select {|company| company.size == "large"}.count
  end

  def self.count_sectors_public
    Company.all.select {|company| company.sector == "public"}.count
  end

  def self.count_sectors_private
    Company.all.select {|company| company.sector == "private"}.count
  end

  def self.count_sectors_academic
    Company.all.select {|company| company.sector == "academic"}.count
  end

end
