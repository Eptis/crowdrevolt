class DropTableAppreciableItems < ActiveRecord::Migration
  def up
    drop_table :appreciated_items
  end

  def down

  end
end
