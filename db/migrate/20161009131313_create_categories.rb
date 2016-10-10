class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_column :specialities, :category_id, :integer
    add_index :specialities, :category_id 
  end
end
