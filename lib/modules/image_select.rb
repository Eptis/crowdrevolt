require "RMagick"
module ImageSelect
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def image_select(total=nil)
      class_eval do
        # Attributes
        attr_accessor :image_select
        
        # Validation
        if total
          validates_length_of :images, :maximum => total
        end
        
        # Relations
        has_many :image_relations, :as => :imageable, :dependent => :destroy
        has_many :images, :through => :image_relations
        
        # Methods
        def image
          images.first
        end
        
        def image_select
          image_ids.join(",")
        end
        
        def image_select=(value)
          self.image_ids = value.split(",")
        end
        
        def first_image(style)
          image ? image.image.url(style) : nil
        end
        
        def images?
          images.present?
        end
      end
    end
  end
end