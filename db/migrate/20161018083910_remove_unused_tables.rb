class RemoveUnusedTables < ActiveRecord::Migration[5.0]
  def change
    drop_table :job_comments
    drop_table :specialities_users
  end
end
