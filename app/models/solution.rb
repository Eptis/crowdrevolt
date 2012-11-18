class Solution < ActiveRecord::Base
  # attr_accessible :title, :body

  def to_param
    "#{id}-#{title}".parameterize
  end
end
