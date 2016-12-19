class CreateProfilePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_pictures do |t|
      t.references :user, index: true
      t.string :picture
      t.boolean :activated, default: false
      t.timestamps
    end
  end
end
