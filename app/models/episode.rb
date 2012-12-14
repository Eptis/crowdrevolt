class Episode < ActiveRecord::Base
  attr_accessible :title, :description, :image_select, :live, :airdate, :livestream_embedcode, :channel_id

  #validatie
  validates_presence_of :title, :description, :image_select, :livestream_embedcode, :airdate

  has_many :questions
  has_many :messages, :as => :chattable

  belongs_to :channel
  default_scope order('airdate DESC')

  include ImageSelect
  image_select

  searchable do
    text :title
    text :description
  end

  def to_param
    "#{id}-#{title}".parameterize
  end
end
