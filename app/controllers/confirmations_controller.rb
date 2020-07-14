# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
class ConfirmationsController < Devise::ConfirmationsController
  respond_to :html
  append_view_path 'app/views/devise'
end
