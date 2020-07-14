# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
# Set relative url root for assets

ActionController::Base.relative_url_root = Setting.base_url if Setting.base_url.present?
