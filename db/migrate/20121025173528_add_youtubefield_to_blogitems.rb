class AddYoutubefieldToBlogitems < ActiveRecord::Migration
  def change
    add_column :blogitems, :youtubeembedlink, :text
  end
end
