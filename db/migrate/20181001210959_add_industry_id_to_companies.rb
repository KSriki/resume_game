class AddIndustryIdToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :industry_id, :integer
  end
end
