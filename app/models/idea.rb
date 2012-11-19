class Idea < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :channel
  has_many :appreciables, :as => :appreciable


  def to_param
    "#{id}-#{title}".parameterize
  end
end
