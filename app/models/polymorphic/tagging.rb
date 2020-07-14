# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
class Tagging < ActsAsTaggableOn::Tagging
  ActiveSupport.run_load_hooks(:crm_tagging, self)
end
