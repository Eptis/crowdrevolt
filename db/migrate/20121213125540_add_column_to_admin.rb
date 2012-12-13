class AddColumnToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :bio, :text
    add_column :admins, :email, :string
    add_column :admins, :skypename, :string
    add_column :admins, :avatar_file_name, :string
    add_column :admins, :avatar_content_type, :string
    add_column :admins, :avatar_file_size, :integer
    add_column :admins, :avatar_updated_at, :datetime

    create_table :channel_admins do |t|
      t.integer :channel_id
      t.integer :admin_id
    end

  end
end
