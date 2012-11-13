class ChangeColumnRewardsRewardable < ActiveRecord::Migration
  def change
    change_column :rewards, :rewardable_id, :integer
  end
end
