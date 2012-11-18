class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :user_id
      t.string :name
      t.string :email
      t.timestamps
    end
    add_column :users, :bio, :text
  end
end
