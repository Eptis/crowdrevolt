class Blogitem < ActiveRecord::Base
  attr_accessible :body, :post_id, :item_type, :youtubeembedlink, :image_select
  validates :youtubeembedlink, :format     => { :with => /\byoutube/ } , :allow_blank => true
  belongs_to :post, :polymorphic => true
  belongs_to :idea, :polymorphic => true
  belongs_to :solution, :polymorphic => true

  include ImageSelect
  image_select

  searchable do
    text :body
  end

end


