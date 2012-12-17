class Text < ActiveRecord::Base
  include ImageSelect
  image_select

  attr_accessible :title, :allow_body, :allow_title, :allow_images, :description, :body, :image_select, :key_title


  # Scopes
  default_scope order(:position)

  # Methods
  def self.by_key(key)
    Text.where(:key => key).first
  end

  def self.update_by_key(key, *args)
    options = args.extract_options!
    text = Text.by_key(key)
    if text
      text.attributes = {
        :description => options[:description],
        :allow_title => options[:allow_title],
        :allow_body => options[:allow_body],
        :allow_images => options[:allow_images]
      }
    else
      text = Text.new(options)
      text.key = key
    end
    text.save
  end
end
