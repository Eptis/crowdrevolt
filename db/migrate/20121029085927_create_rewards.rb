class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.integer :user_id
      t.integer :points
      t.string :rewardable_id
      t.string :rewardable_type
      t.timestamps
    end
  end
end
