# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
module AddressesHelper
  # Sets up new address when used in forms.
  #----------------------------------------------------------------------------
  def get_address(asset, type)
    asset.send("build_#{type}".to_sym) if asset.send(type.to_sym).nil?
    asset.send(type.to_sym)
  end

  def priority_countries
    Setting[:priority_countries]
  end
end
