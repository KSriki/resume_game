class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :size
      t.string :sector

      t.timestamps
    end
  end
end
