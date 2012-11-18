class CreateAppreciables < ActiveRecord::Migration
  def change
    create_table :appreciables do |t|
      t.integer :user_id
      t.integer :appreciable_id
      t.string :appreciable_type
      t.timestamps
    end
  end
end
