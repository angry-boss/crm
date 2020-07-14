# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
ActionController::Renderers.add :csv do |objects, options|
  filename = options[:filename] || controller_name || 'data'
  str = CRM::ExportCSV.from_array(objects)
  send_data str, type: :csv,
                 disposition: "attachment; filename=#{filename}.csv"
end
