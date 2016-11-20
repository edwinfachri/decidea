class CreateJobPostUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :job_post_users do |t|
      t.integer :job_post_id
      t.integer :user_id

      t.timestamps
    end
    add_index :job_post_users, :job_post_id
    add_index :job_post_users, :user_id
    add_index :job_post_users, [:job_post_id, :user_id], unique: true
  end
end
