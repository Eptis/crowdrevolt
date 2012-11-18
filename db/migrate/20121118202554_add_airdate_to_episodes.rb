class AddAirdateToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :airdate, :datetime
  end
end
