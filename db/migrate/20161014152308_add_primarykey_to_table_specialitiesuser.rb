class AddPrimarykeyToTableSpecialitiesuser < ActiveRecord::Migration[5.0]
  def change
    add_column :specialities_users, :id, :primary_key
  end
end
