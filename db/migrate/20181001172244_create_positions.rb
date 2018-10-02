class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.string :title
      t.text :description
      t.date :start_date
      t.date :end_date
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
  end
end
