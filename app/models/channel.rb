class Channel < ActiveRecord::Base
  attr_accessible :title, :description, :image_select, :status, :admin_ids

  #validatie
  validates_presence_of :title, :description, :image_select

  has_many :episodes
  has_and_belongs_to_many :admins
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
