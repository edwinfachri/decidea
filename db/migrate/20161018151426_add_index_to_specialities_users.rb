class AddIndexToSpecialitiesUsers < ActiveRecord::Migration[5.0]
  def change
    add_index :specialities_users, [:user_id, :speciality_id], unique: true
  end
end
