# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require "csv"

module CRM
  class ExportCSV
    # CSV export. Based on to_csv Rails plugin by Ary Djmal
    # https://github.com/arydjmal/to_csv
    #----------------------------------------------------------------------------
    def self.from_array(items = [])
      return '' if items.empty?

      # Infer column types from the first item in the array
      klass = items.first.class
      columns = klass.columns.map(&:name).reject { |column| column =~ /password|token/ }
      columns << 'tags' if klass.taggable?
      CSV.generate do |csv|
        csv << columns.map { |column| klass.human_attribute_name(column) }
        items.each do |item|
          csv << columns.map do |column|
            if column == 'tags'
              item.tags.join(' ')
            else
              item.send(column)
            end
          end
        end
      end
    end
  end
end
