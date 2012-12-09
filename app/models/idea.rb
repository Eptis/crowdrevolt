class Idea < ActiveRecord::Base
  attr_accessible :title, :image_select, :title, :blogitems_attributes, :description, :channel_id

  #validatie
  validates_presence_of :title, :description
  validates_length_of :description, :minimum => 25, :message => "Omschrijving moet minstens 25 karakters bevatten"


  has_many :appreciables, :as => :appreciable
  # blog items
  has_many :blogitems, :as => :ownable
  has_many :rewards, :as => :rewardable
  belongs_to :user
  belongs_to :channel
  accepts_nested_attributes_for :blogitems, :allow_destroy => true

  #comments
  has_many :comments, :as => :commentable, :dependent => :destroy


  # Images select
  include ImageSelect
  image_select


  searchable do
    text :title
    text :description
  end

  # Methods
  def published_at_string
    published_at? ? strf_published_at : I18n.t(:no)
  end

  def published_at_form
    published_at.strftime("%d-%m-%Y %H:%M") if published_at?
  end

  def strf_published_at
    I18n.l(published_at, :format => :long) if published_at?
  end

  def to_param
    "#{id}-#{title}".parameterize
  end
end
