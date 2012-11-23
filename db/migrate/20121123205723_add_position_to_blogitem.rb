class AddPositionToBlogitem < ActiveRecord::Migration
  def change
    add_column :blogitems, :position, :integer
  end
end
