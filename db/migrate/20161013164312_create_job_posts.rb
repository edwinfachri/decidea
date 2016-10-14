class CreateJobPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :job_posts do |t|
      t.string  :job_title
      t.string  :job_location
      t.text    :job_description
      t.integer :speciality_id
      
      t.string :company_name
      t.text :company_description
      t.string :company_website
      
      t.timestamps
    end
  end
end
