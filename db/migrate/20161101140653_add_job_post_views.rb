class AddJobPostViews < ActiveRecord::Migration[5.0]
  def change
    create_table :job_post_views do |t|
      t.integer :job_post_id
      t.integer :user_id

      t.timestamps
    end
    add_index :job_post_views, :job_post_id
    add_index :job_post_views, :user_id
    add_index :job_post_views, [:job_post_id, :user_id], unique: true
  end
end
