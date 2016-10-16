class AddLogoToJobPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :job_posts, :logo, :string
  end
end
