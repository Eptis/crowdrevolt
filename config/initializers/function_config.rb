class FunctionConfig
  FUNCTION_CONFIG = YAML.load_file("#{Rails.root}/config/function_config.yml")

  def self.allowed?(key, enabled="enabled")
    key = key.to_s
    enabled = enabled.to_s
    FUNCTION_CONFIG[key][enabled]
  end
end