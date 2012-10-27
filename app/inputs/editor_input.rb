class EditorInput < SimpleForm::Inputs::Base
  def input
    "<div class=\"ckEditor\">#{@builder.text_area(attribute_name, input_html_options)}</div>".html_safe
  end
end