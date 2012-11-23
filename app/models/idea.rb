class Idea < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :channel
  has_many :appreciables, :as => :appreciable
  has_many :blogitems, :as => :ownable


  searchable do
    text :title
    text :description
  end

  def to_param
    "#{id}-#{title}".parameterize
  end
end
