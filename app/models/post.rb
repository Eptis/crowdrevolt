class Post < ActiveRecord::Base
  attr_accessible :title, :body, :description, :published_at, :blogitems_attributes, :image_select, :channel_id

  #validatie
  validates_presence_of :title, :description, :image_select, :published_at
  validates_presence_of :blogitems, :message => "Er is nog geen inhoud"



  # blog items
  has_many :blogitems, :as => :ownable
  belongs_to :admin
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
    text :blogitems do
      blogitems.map { |blogitem| blogitem.body }
    end
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
