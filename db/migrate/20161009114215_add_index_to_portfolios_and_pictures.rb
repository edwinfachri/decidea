class AddIndexToPortfoliosAndPictures < ActiveRecord::Migration[5.0]
  def change
    add_index :portfolios, :user_id
    add_index :pictures, :portfolio_id
    create_join_table :users, :specialities do |t|
      t.index :user_id
      t.index :speciality_id
    end
  end
end
