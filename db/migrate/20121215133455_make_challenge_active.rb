class MakeChallengeActive < ActiveRecord::Migration
  def change
    add_column :challenges, :active, :boolean, :default => true
  end
end
