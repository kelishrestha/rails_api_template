# frozen_string_literal: true
configuration = ERB.new(File.read("#{Rails.root}/config/app_config.yml")).result
APP_CONFIG = YAML.load(configuration)[Rails.env]
