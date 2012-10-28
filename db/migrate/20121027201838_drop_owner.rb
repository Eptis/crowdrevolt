class DropOwner < ActiveRecord::Migration
  def change
    drop_table :owner_relations
  end
end
