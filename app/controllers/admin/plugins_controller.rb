# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
class Admin::PluginsController < Admin::ApplicationController
  before_action :setup_current_tab, only: [:index]

  # GET /admin/plugins
  # GET /admin/plugins.xml
  #----------------------------------------------------------------------------
  def index
    @plugins = CRM::Plugin.list

    respond_with(@plugins)
  end

  protected

  def setup_current_tab
    set_current_tab('admin/plugins')
  end
end
