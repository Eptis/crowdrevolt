class Solution < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :challenge
  has_many :appreciables, :as => :appreciable
  has_many :blogitems, :as => :ownable

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
