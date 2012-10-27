module AdminHelper
    # Check if you're in the right controller.
  def menu_active?(*args)
    options = args.extract_options!
    if args.include?(controller_name.to_sym)
      if params[:controller] == "categories" && options[:model].present?
        if @category
          options[:model] == @category.model_name ? "active" : nil
        else
          options[:model] == params[:model] ? "active" : nil
        end
      else
        "active"
      end
    else
      nil
    end
  end

  # Create a menu link.
  def menu_link(key, path, current, *args, &block)
    options = args.extract_options!
    dropdown = options[:dropdown] and options.delete(:dropdown)
    options.reverse_merge!(:class => "dropdown-toggle", :data => { :toggle => "dropdown" }) if dropdown

    if block_given?
      if dropdown
        block_content = content_tag(:ul, :class => "dropdown-menu", &block)
      else
        block_content = capture(&block)
      end
    end

    content_tag(:li, :class => "#{"dropdown" if dropdown} #{current}") do
      if block_given?
        link_to(admin_t(:menu, key).html_safe + content_tag(:b, nil, :class => "caret"), path, options) + block_content
      else
        link_to(admin_t(:menu, key), path, options)
      end
    end
  end

  # Back link for all views.
  def back_to(url, *args)
    options = args.extract_options!
    options.reverse_merge!(:label => admin_t(:back), :class => "btn")
    lbl = options[:label] and options.delete(:label)
    link_to((url.is_a?(String) || (url.is_a?(Array) && url.include?(:admin)) ? url : [:admin, *url]), options) do
      content_tag(:i, nil, :class => "icon-chevron-left") + " " + lbl
    end
  end

  # New link for all views.
  def new_link(object, *args)
    options = args.extract_options!
    options.reverse_merge!(:label => admin_t("#{object}".pluralize, :new), :class => "btn")
    url = (options[:url].blank? ? [:new, :admin, object] : options[:url])
    lbl = options[:label] and options.delete(:label)
    link_to(url, options) do
      content_tag(:i, nil, :class => "icon-plus") + " " + lbl
    end
  end

  # Show link for all views.
  def show_link(object, *args)
    options = args.extract_options!
    options.reverse_merge!(:label => admin_t(:show), :class => "btn")
    url = (options[:url].blank? ? [:admin, object] : options[:url])
    lbl = options[:label] and options.delete(:label)
    link_to(url, options) do
      content_tag(:i, nil, :class => "icon-search") + " " + lbl
    end
  end

  # Edit link for all views.
  def edit_link(object, *args)
    options = args.extract_options!
    options.reverse_merge!(:label => admin_t(:edit), :class => "btn")
    url = (options[:url].blank? ? [:edit, :admin, object] : options[:url])
    url = "#{url_for(url)}?divide=#{options[:divide]}" if options[:divide]
    lbl = options[:label] and options.delete(:label) and options.delete(:divide)
    link_to(url, options) do
      content_tag(:i, nil, :class => "icon-pencil") + " " + lbl
    end
  end

  # Destroy link for all views.
  def delete_link(object, *args)
    options = args.extract_options!
    options.reverse_merge!(:confirm => t("admin.confirm"), :method => :delete, :label => admin_t(:delete), :class => "btn btn-danger")
    url = (options[:url].blank? ? [:admin, object] : options[:url])
    lbl = options[:label] and options.delete(:label)
    link_to(url, options) do
      content_tag(:i, nil, :class => "icon-remove icon-white") + " " + lbl
    end
  end

  # Link to divide the form.
  def divide_link(key, object, *args)
    options = args.extract_options!
    options.reverse_merge!(:divide => key, :label => admin_t(:edit))
    class_name = object.class.name.underscore
    lbl = admin_t(:divide, class_name, key, :default => admin_t(:divide, :defaults, key))
    content_tag(:h2, :class => "divide_link") do
      lbl.html_safe + " " + edit_link(object, options)
    end
  end

  # URL for categories.
  def categories_link(obj, action=:show)
    model_name = obj.is_a?(String) ? obj : obj.class.name
    case action
      when :index   then admin_categories_path(:model => model_name)
      when :show    then admin_category_path(obj, :model => model_name)
      when :new     then new_admin_category_path(:model => model_name)
      when :edit    then edit_admin_category_path(obj, :model => model_name)
      when :destroy then admin_category_path(obj, :model => model_name)
    end
  end

  # Admin translation helper.
  def admin_t(*args)
    options = args.extract_options!
    t("admin.#{args.compact.join(".")}", options)
  end

  # Breadcrumbs helper.
  def breadcrumbs(&block)
    content_for(:breadcrumb, &block)
  end

  def crumb(lbl, path=nil, *args)
    seperator = content_tag(:span, "/", :class => "divider")
    if path
      options = args.extract_options!
      content_tag(:li, link_to(lbl, path, options) + seperator)
    else
      content_tag(:li, lbl)
    end
  end

  # Buttons
  def buttons(content=nil, &block)
    data = capture(&block) unless content
    content_for(:buttons, (content ? content : data))
  end

  # Flags
  def flags
    flags = []
    %w(en nl).each do |lang|
      flags << link_to(image_tag("#{lang}.png", :width => 32, :height => 32), params.merge(:locale => lang), :style => params[:locale] == lang ? nil : "opacity: 0.5")
    end
    content_tag(:div, raw(flags.join), :class => "control-group")
  end
end
