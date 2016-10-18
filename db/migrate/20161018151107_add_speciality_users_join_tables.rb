class AddSpecialityUsersJoinTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :job_posts_users
    create_join_table :users, :specialities do |t|
      t.index :user_id
      t.index :speciality_id
    end
  end
end
