class CreateJoinTablesForJobUserAndJobComment < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :job_posts do |t|
      t.index :user_id
      t.index :job_post_id
    end
    create_table :job_comments do |t|
      t.integer :user_id
      t.integer :job_post_id
      t.string :comment

      t.timestamps
    end
    add_index :job_comments, :user_id
    add_index :job_comments, :job_post_id
  end
end
