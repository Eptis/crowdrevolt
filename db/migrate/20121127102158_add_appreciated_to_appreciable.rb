class AddAppreciatedToAppreciable < ActiveRecord::Migration
  def change
    add_column :appreciables, :appreciated, :boolean
  end
end
