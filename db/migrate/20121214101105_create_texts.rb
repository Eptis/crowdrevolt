class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :key
      t.text :description
      t.string :title
      t.text :body
      t.boolean :allow_title
      t.boolean :allow_body
      t.integer :position
      t.boolean :allow_images
      t.timestamps
    end
  end
end
