class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string   :name
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.timestamps
    end

    create_table :image_relations do |t|
      t.integer :image_id
      t.integer :imageable_id
      t.string  :imageable_type
    end
    add_index :image_relations, [:image_id, :imageable_id, :imageable_type], :name => :index_image_relations
  end
end
