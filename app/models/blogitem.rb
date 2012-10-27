class Blogitem < ActiveRecord::Base
  attr_accessible :body, :post_id, :item_type, :youtubeembedlink, :image_select
  validates :youtubeembedlink, :format     => { :with => /\byoutube/ } , :allow_blank => true
  belongs_to :posts

  include ImageSelect
  image_select


end


