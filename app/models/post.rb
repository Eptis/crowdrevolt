class Post < ActiveRecord::Base
  attr_accessible :title, :body, :description, :published_at

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
