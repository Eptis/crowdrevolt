class Channel < ActiveRecord::Base
  attr_accessible :title, :description, :image_select

  has_many :episodes
  has_many :changemakers
  has_many :posts
  has_many :challenges
  has_many :ideas
  has_many :messages, :as => :chattable

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
