class CreateSpecialityJobPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :speciality_job_posts do |t|
      t.integer :job_post_id
      t.integer :speciality_id

      t.timestamps
    end
    add_index :speciality_job_posts, :job_post_id
    add_index :speciality_job_posts, :speciality_id
    add_index :speciality_job_posts, [:job_post_id, :speciality_id], unique: true
  end
end
