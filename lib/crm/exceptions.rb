# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
module CRM
  class MissingSettings < StandardError; end
  class ObsoleteSettings < StandardError; end
end

class ActionController::Base
  rescue_from CRM::MissingSettings,  with: :render_crm_exception
  rescue_from CRM::ObsoleteSettings, with: :render_crm_exception

  private

  def render_crm_exception(exception)
    logger.error exception.inspect
    render layout: false, template: "/layouts/500", format: :html, status: 500, locals: { exception: exception }
  end
end
