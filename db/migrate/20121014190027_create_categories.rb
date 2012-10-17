class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string   :name
      t.integer  :position,   :default => 0
      t.boolean  :active,     :default => false
      t.integer  :parent_id
      t.string   :model_name
      t.timestamps
    end

    create_table :categorizations do |t|
      t.integer :categorization_id
      t.string  :categorization_type
      t.integer :category_id
    end
    add_index :categorizations, [:categorization_id, :categorization_type, :category_id], :name => :index_categorizations
  end
end
