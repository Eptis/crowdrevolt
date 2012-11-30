class AddAppreciatedItemsTable < ActiveRecord::Migration
  def change
    create_table :appreciated_items do |t|
      t.integer :user_id
      t.integer :item_id
      t.string :item_type
    end
  end

end
