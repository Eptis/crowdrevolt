class Setting < ActiveRecord::Base
  attr_accessible :value, :description, :key
  # Scopes
  # default_scope order(:position)

  # Methods
  def self.by_key(key)
    Setting.where(:key => key).first.try(:value)
  end

  def self.update_by_key(key, *args)
    options = args.extract_options!
    setting = Setting.find_by_key(key)
    if setting
      setting.attributes = {
        :description => options[:description]
      }
    else
      setting = Setting.new(options)
      setting.key = key
    end
    setting.save
  end
end
