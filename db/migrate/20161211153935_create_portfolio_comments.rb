class CreatePortfolioComments < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolio_comments do |t|
      t.references :user, index: true
      t.references :portfolio, index: true
      t.string :comment
      t.timestamps
    end
  end
end
