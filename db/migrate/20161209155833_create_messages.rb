class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :subject
      t.text :body
      t.references :message_user, index: true
      t.references :user, index: true
      t.boolean :read, :default => false

      t.timestamps
    end
  end
end
