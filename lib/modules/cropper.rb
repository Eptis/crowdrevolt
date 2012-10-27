module Cropper
  def self.included(base)
    base.class_eval do
      # Attributes
      attr_accessor :crop_x, :crop_y, :crop_w, :crop_h, :thumbnail

      # Callbacks
      before_save :crop_image, :if => lambda { |image| image.thumbnail.present? }

      # Methods
      def crop_image
        orig_path = image.path
        thumb_path = image.path(thumbnail.to_sym)
        img = Magick::Image.read(orig_path).first
        img.crop!(crop_x.to_i, crop_y.to_i, crop_w.to_i, crop_h.to_i, true)
        img.resize!(min_w(thumbnail), min_h(thumbnail))
        img.write(thumb_path)
      end

      def ratio(thumb_type)
        min_w(thumb_type) / min_h(thumb_type)
      end

      def min_w(thumb_type)
        image_size(thumb_type.to_sym).match(/^(\d*)x\d*\#$/).captures.join.to_f
      end

      def min_h(thumb_type)
        image_size(thumb_type.to_sym).match(/^\d*x(\d*)\#$/).captures.join.to_f
      end
    end
  end
end