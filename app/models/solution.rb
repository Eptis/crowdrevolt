class Solution < ActiveRecord::Base
  #validatie
  validates_presence_of :title, :description
  validates_length_of :description, :minimum => 25, :message => "Omschrijving moet minstens 25 karakters bevatten"

  # Images select
  include ImageSelect
  image_select

  attr_accessible :title, :body, :description, :published_at, :blogitems_attributes, :image_select, :challenge_id
  has_many :blogitems, :as => :ownable
  has_many :appreciables, :as => :appreciable
  has_many :image_relations, :as => :imageable

  belongs_to :user
  belongs_to :challenge
  belongs_to :channel
  accepts_nested_attributes_for :blogitems, :allow_destroy => true

  #comments
  has_many :comments, :as => :commentable, :dependent => :destroy



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
