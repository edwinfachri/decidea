class AddDeleteToMessageAndComment < ActiveRecord::Migration[5.0]
  def change
    add_column :job_post_comments, :deleted, :boolean, default: false
    add_column :messages, :deleted, :boolean, default: false
    add_column :portfolio_comments, :deleted, :boolean, default: false
    add_column :job_posts, :deleted, :boolean, default: false
    add_column :portfolios, :deleted, :boolean, default: false
    add_column :pictures, :deleted, :boolean, default: false
  end
end
