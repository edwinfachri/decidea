class AddSeenAndLoveAndChangeDesriptionToDescriptionInPicture < ActiveRecord::Migration[5.0]
  def change
    rename_column :pictures, :desription, :description
  end
end
