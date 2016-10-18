class AddCommentToJobPost < ActiveRecord::Migration[5.0]
  def change
    create_table :job_post_comments do |t|
      t.integer :job_post_id
      t.integer :user_id
      t.string :comment

      t.timestamps
    end
    add_index :job_post_comments, :job_post_id
    add_index :job_post_comments, :user_id
  end
end
