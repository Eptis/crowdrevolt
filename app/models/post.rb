class Post < ActiveRecord::Base
  attr_accessible :title, :body, :description, :published_at, :blogitems_attributes, :image_select
  # blog items
  has_many :blogitems
  belongs_to :user
  belongs_to :channel
  accepts_nested_attributes_for :blogitems, :allow_destroy => true

  #comments
  has_many :comments, :as => :commentable, :dependent => :destroy

  # Images select
  include ImageSelect
  image_select

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
