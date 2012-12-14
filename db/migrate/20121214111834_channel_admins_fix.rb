class ChannelAdminsFix < ActiveRecord::Migration
  def change
    drop_table :admins_channels

    create_table :admins_channels, :id => false do |t|
      t.integer :channel_id
      t.integer :admin_id
    end
  end
end
