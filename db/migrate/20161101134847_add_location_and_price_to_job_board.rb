class AddLocationAndPriceToJobBoard < ActiveRecord::Migration[5.0]
  def change
    add_column :job_posts, :city_id, :integer
    remove_column :job_posts, :seen_counter
  end
end
