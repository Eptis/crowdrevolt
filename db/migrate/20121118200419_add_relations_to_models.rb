class AddRelationsToModels < ActiveRecord::Migration
  def change
    add_column :ideas, :channel_id, :integer
    add_column :posts, :channel_id, :integer
    add_column :challenges, :channel_id, :integer
    add_column :episodes, :channel_id, :integer
    add_column :solutions, :challenge_id, :integer
    add_column :questions, :episode_id, :integer
  end
end
