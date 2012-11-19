class Solution < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :challenge
  has_many :appreciables, :as => :appreciable
  def to_param
    "#{id}-#{title}".parameterize
  end
end
