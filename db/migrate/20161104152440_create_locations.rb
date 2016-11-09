class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name

      t.timestamps
    end
    rename_column :job_posts, :city_id, :location_id
    remove_column :job_posts, :job_location
  end
end
