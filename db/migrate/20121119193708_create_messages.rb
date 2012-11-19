class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.string :name
      t.string :email
      t.integer :user_id
      t.integer :chattable_id
      t.string :chattable_type
      t.timestamps
    end
  end
end
