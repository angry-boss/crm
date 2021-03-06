# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
module CRM
  class Tabs
    cattr_accessor :main
    cattr_accessor :admin

    # Class methods.
    #----------------------------------------------------------------------------
    class << self
      def main
        @@main ||= (Setting[:tabs]&.dup)
      end

      def admin
        @@admin ||= (Setting[:admin_tabs]&.dup)
      end
    end
  end
end
