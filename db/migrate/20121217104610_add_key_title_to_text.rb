class AddKeyTitleToText < ActiveRecord::Migration
  def change
    add_column :texts, :key_title, :string
  end
end
