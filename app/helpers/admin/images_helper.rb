module Admin::ImagesHelper
  def cropped_image(image)
    image_tag(image.image.url, :id => "Jcrop", :data => {
      :ratio => image.ratio(params[:crop]),
      :min_w => image.min_w(params[:crop]),
      :min_h => image.min_h(params[:crop])
    })
  end

  # Image image crop tag
  def image_thumb(image, thumb, *args)
    options = args.extract_options!
    options[:width], options[:height] = image.image_size(thumb).match(/(\d*)x(.\d*)/).captures if options[:width].blank? && options[:height].blank?
    image_tag(image.image.url(thumb), options)
  end

  # Pagination for image
  def paginate_images(images)
    will_paginate(images, :params => { :controller => "admin/images", :action => "index" })
  end
end
