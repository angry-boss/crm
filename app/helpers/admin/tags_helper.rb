# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
module Admin::TagsHelper
  def link_to_confirm(tag)
    link_to(t(:delete) + "?", confirm_admin_tag_path(tag), method: :get, remote: true)
  end
end
