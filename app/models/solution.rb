class Solution < ActiveRecord::Base
  attr_accessible :title, :body, :description, :published_at, :blogitems_attributes, :image_select, :challenge_id
  has_many :blogitems, :as => :ownable
  has_many :appreciables, :as => :appreciable
  belongs_to :user
  belongs_to :challenge
  belongs_to :channel
  accepts_nested_attributes_for :blogitems, :allow_destroy => true

  #comments
  has_many :comments, :as => :commentable, :dependent => :destroy

  # Images select
  include ImageSelect
  image_select

  #relatie met user
  belongs_to :appreciated_item


  searchable do
    text :title
    text :description
    text :blogitems do
      blogitems.map { |blogitem| blogitem.body }
    end
  end

  def to_param
    "#{id}-#{title}".parameterize
  end
end
