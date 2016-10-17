class AddPriceToJobPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :job_posts, :rates, :integer
  end
end
