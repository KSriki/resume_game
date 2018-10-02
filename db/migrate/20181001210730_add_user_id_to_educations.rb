class AddUserIdToEducations < ActiveRecord::Migration[5.2]
  def change
    add_column :educations, :user_id, :integer
  end
end
