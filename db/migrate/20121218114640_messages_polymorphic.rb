class MessagesPolymorphic < ActiveRecord::Migration
  def change
    add_column :messages, :author_type, :string
    rename_column :messages, :user_id, :author_id
  end
end
