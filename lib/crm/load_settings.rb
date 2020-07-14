# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------

#
# Register and call when Setting class is loaded
# Load settings.default.yml
# Then override with settings.yml
# Don't override default settings in test environment
ActiveSupport.on_load(:crm_setting) do
  setting_files = [CRM.root.join("config", "settings.default.yml")]
  setting_files << Rails.root.join("config", "settings.yml") unless Rails.env == 'test'
  setting_files.each do |settings_file|
    Setting.load_settings_from_yaml(settings_file) if File.exist?(settings_file)
  end
end
