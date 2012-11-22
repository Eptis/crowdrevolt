class AddHideToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :hide, :boolean, :default => true
  end
end
