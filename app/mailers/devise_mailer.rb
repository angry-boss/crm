# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
class DeviseMailer < Devise::Mailer
  def template_paths
    ["devise/mailer"]
  end
end
