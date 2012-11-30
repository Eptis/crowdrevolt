class AddChannelToSolutions < ActiveRecord::Migration
  def change
    add_column :solutions, :channel_id, :integer
  end
end
