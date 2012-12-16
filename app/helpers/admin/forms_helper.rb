module Admin::FormsHelper
  # Cancel link for forms.
  def cancel_link(url, *args)
    options = args.extract_options!
    options.merge!(:class => "btn btn-large")
    link_to admin_t(:cancel), url, options
  end

  # Helper to divide the form.
  def divide(*args, &block)
    yield if params[:divide].blank? || (params[:divide].present? && args.include?(params[:divide].to_sym))
  end

  module Builder
    # Link to remove the dynamic fields.
    def link_to_remove_fields(name, *args)
      options = args.extract_options!
      options.merge!(:class => "remove_fields btn")
      hidden_field(:_destroy) + @template.link_to(name, "#", options)
    end

    # Link to add dynamic fields.
    def link_to_add_fields(name, association, *args)
      options = args.extract_options!

      new_object = object.class.reflect_on_association(association).klass.new
      fields = fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
        @template.render(association.to_s.singularize + "_fields", :f => builder)
      end

      options.merge!(:class => "add_fields btn", :data => { :association => association, :content => CGI::escapeHTML(fields.gsub(/\t|\n|\r/, "")) })
      @template.link_to(name, "#", options)
    end

    # Add a submit block to a form.
    def submit_block(link)
      @template.content_tag(:div, :class => "pull-right") do
        submit(:class => "btn btn-primary") + @template.content_tag(:span, @template.admin_t(:or), :class => "or") + @template.cancel_link(link)
      end
    end

    # Image selector
    def image_select(total=nil)
      @template.render("admin/images/select", :f => self, :total => total)
    end

    def front_image_select(total=nil)
      @template.render("images/select", :f => self, :total => total)
    end

    # Category selector
    def category_select
      if AdminConfig.allowed?(object.class.name.underscore.pluralize, :subcategories)
        options = @template.grouped_options_for_select(Category.nested(object.class.name), object.category_ids)
      else
        options = @template.options_for_select(Category.options(object.class.name), object.category_ids)
      end
      input :category_ids do
        select :category_ids, options, {}, :multiple => "multiple"
      end
    end
  end
end

ActionView::Helpers::FormBuilder.send(:include, Admin::FormsHelper::Builder)