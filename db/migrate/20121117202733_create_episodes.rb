class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.text :description
      t.boolean :live
      t.string :livestream_embedcode

      t.timestamps
    end
  end
end
