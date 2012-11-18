class CreateChangemakers < ActiveRecord::Migration
  def change
    create_table :changemakers do |t|
      t.string :name
      t.text :bio
      t.string :fb_link
      t.string :tw_link
      t.timestamps
    end
  end
end
