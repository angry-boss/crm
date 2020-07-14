# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
class LeadObserver < ActiveRecord::Observer
  observe :lead

  @@leads = {}

  def before_update(item)
    @@leads[item.id] = Lead.find(item.id).freeze
  end

  def after_update(item)
    original = @@leads.delete(item.id)
    return log_activity(item, :reject) if original&.status != "rejected" && item.status == "rejected"
  end

  private

  def log_activity(item, event)
    item.send(item.class.versions_association_name).create(event: event, whodunnit: PaperTrail.request.whodunnit)
  end

  ActiveSupport.run_load_hooks(:crm_lead_observer, self)
end
