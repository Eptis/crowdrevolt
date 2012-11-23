class AddPostAttrToIdea < ActiveRecord::Migration
  def change

    add_column :ideas, :title, :string
    add_column :ideas, :description, :text
    add_column :ideas, :user_id, :integer
    remove_column :posts, :body
  end
end
