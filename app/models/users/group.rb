# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :permissions

  validates :name, presence: true, uniqueness: true

  ActiveSupport.run_load_hooks(:crm_group, self)
end
