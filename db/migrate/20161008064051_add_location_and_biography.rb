class AddLocationAndBiography < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :location, :string
    add_column :users, :biography, :text
  end
end
