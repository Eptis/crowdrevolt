class ClearCommentsOfAdmin < ActiveRecord::Migration
  def change
    remove_column :comments, :admin_id, :user_type
  end
end
