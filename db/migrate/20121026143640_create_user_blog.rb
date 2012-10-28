class CreateUserBlog < ActiveRecord::Migration
  def change
    # add_column :users, :skypename, :string
    add_column :posts, :admin_id, :integer

    create_table :user_posts do |t|
      t.string   :title
      t.text     :description
      t.text     :body
      t.datetime :published_at
      t.integer  :user_id
      t.timestamps
    end

    create_table :user_blogitems do |t|
      t.text     :body
      t.text     :youtubeembedlink
      t.integer  :user_post_id
      t.string   :item_type
      t.datetime :published_at
      t.timestamps
    end


  end
end
