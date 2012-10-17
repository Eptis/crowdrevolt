class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string   :title
      t.text     :description
      t.text     :body
      t.datetime :published_at
      t.timestamps
    end

    create_table :taggings do |t|
      t.integer  :tag_id
      t.integer  :taggable_id
      t.string   :taggable_type
      t.integer  :tagger_id
      t.string   :tagger_type
      t.string   :context,       :limit => 128
      t.datetime :created_at
    end
    add_index :taggings, [:tag_id]
    add_index :taggings, [:taggable_id, :taggable_type, :context]

    create_table :tags do |t|
      t.string :name
    end

  end
end
