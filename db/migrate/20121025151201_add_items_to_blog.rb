class AddItemsToBlog < ActiveRecord::Migration
  def change
    create_table :blogitems do |t|
      t.text   :body
      t.integer   :post_id
      t.string   :item_type
      t.timestamps
    end
  end
end
