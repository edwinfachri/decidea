class AddColumnsToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :portfolio_id, :integer
    add_column :pictures, :picture, :string
    add_column :portfolios, :user_id, :integer
  end
end
