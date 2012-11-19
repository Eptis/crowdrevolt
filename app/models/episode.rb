class Episode < ActiveRecord::Base
  attr_accessible :title, :description, :image_select, :live, :airdate, :livestream_embedcode, :channel_id
  has_many :questions

  belongs_to :channel

  include ImageSelect
  image_select

  def to_param
    "#{id}-#{title}".parameterize
  end
end
