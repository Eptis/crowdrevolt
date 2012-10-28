class CreateOwnerRelations < ActiveRecord::Migration
  def change
    create_table :owner_relations do |t|
      t.integer :comment_id
      t.integer :ownerable_id
      t.string :ownerable_type
      t.timestamps
    end
  end
end
