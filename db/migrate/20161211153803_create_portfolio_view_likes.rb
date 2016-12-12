class CreatePortfolioViewLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolio_view_likes do |t|
      t.references :user, index: true
      t.references :portfolio, index: true
      t.boolean :like, :default => false
      t.timestamps
    end
    add_index :portfolio_view_likes, [:portfolio_id, :user_id], unique: true
  end
end
