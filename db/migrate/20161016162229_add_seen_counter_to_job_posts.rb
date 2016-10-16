class AddSeenCounterToJobPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :job_posts, :seen_counter, :integer, :default => 0
  end
end
