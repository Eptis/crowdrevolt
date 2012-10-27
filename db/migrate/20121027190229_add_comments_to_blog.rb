class AddCommentsToBlog < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :body
      t.integer :user_id
      t.integer :admin_id
      t.string :user_type
      t.timestamps
    end

    add_column :posts, :user_id, :integer
    add_column :posts, :admin_id, :integer
    add_column :users, :active, :boolean, :default => true
    add_column :users, :skypename, :string
    add_column :users, :show_skype, :boolean
  end
end
