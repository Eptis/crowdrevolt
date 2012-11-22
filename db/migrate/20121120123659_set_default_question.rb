class SetDefaultQuestion < ActiveRecord::Migration
  def change

    change_column :questions, :approved, :boolean, :default => false
  end
end
