class AddLinksToThings < ActiveRecord::Migration
  def change
    add_column :channels, :links, :text
    add_column :episodes, :links, :text
  end
end
