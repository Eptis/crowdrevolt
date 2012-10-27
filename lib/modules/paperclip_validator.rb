module PaperclipValidator
  def self.included(base)
    base.class_eval do
      after_validation :set_all_paperclip_errors
      
      def self.set_paperclip_message(attribute, error)
        if I18n.t("simple_form.paperclip.#{name.underscore}.#{attribute}.#{error}").match("translation missing")
          if I18n.t("simple_form.paperclip.defaults.#{error}").match("translation missing")
            I18n.t("simple_form.paperclip.defaults.default")
          else
            I18n.t("simple_form.paperclip.defaults.#{error}")
          end
        else
          I18n.t("simple_form.paperclip.#{name.underscore}.#{attribute}.#{error}")
        end
      end
      
      def self.validates_paperclip_content_type(attribute, *args)
        options = args.extract_options!
        options[:message] ||= set_paperclip_message(attribute, :content)
        validates_attachment_content_type(attribute, options)
      end

      def self.validates_paperclip_presence(attribute, *args)
        options = args.extract_options!
        options[:message] ||= set_paperclip_message(attribute, :blank)
        validates_attachment_presence(attribute, options)
      end

      def self.validates_paperclip_size(attribute, *args)
        options = args.extract_options!
        options[:message] ||= set_paperclip_message(attribute, :size)
        validates_attachment_size(attribute, options)
      end

      def set_all_paperclip_errors
        attachments = attributes.select { |attribute| attribute[0] && attribute[0] =~ /_file_name$/ }
        attachments.each do |attachment|
          set_paperclip_errors(attachment[0].gsub("_file_name", "").to_sym)
        end
      end

      def set_paperclip_errors(attachment)
        all_errors = errors.to_hash

        if all_errors.has_key?("#{attachment}_file_name".to_sym) || all_errors.has_key?("#{attachment}_file_size".to_sym) || all_errors.has_key?("#{attachment}_content_type".to_sym)
          all_errors["#{attachment}".to_sym] = []
          all_errors["#{attachment}".to_sym].push(errors["#{attachment}_content_type".to_sym].join) if errors["#{attachment}_content_type".to_sym].present?
          all_errors["#{attachment}".to_sym].push(errors["#{attachment}_file_size".to_sym].join) if errors["#{attachment}_file_size".to_sym].present?
          all_errors["#{attachment}".to_sym].push(errors["#{attachment}_file_name".to_sym].join) if errors["#{attachment}_file_name".to_sym].present?

          all_errors.delete("#{attachment}_content_type".to_sym)
          all_errors.delete("#{attachment}_file_size".to_sym)
          all_errors.delete("#{attachment}_file_name".to_sym)
        end

        self.errors.clear
        all_errors.each do |key, value|
          self.errors[key] = value
        end
      end
    end
  end
end