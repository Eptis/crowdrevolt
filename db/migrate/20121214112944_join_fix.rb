class JoinFix < ActiveRecord::Migration
  def change
    # drop_table :admins_channels

    create_table :admins_channels, :id => false do |t|
      t.references :channel
      t.references :admin
    end
  end
end
