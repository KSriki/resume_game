class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.date :start_date
      t.date :end_date
      t.integer :institution_id

      t.timestamps
    end
  end
end
