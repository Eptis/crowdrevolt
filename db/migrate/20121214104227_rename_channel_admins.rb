class RenameChannelAdmins < ActiveRecord::Migration
  def change
    rename_table "channel_admins", "admins_channels"
  end
end
