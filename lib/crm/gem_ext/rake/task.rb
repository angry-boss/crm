# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require 'rake/task'

module Rake
  Task.class_eval do
    # Removes a Rake task
    def self.remove(task_name)
      Rake.application.instance_variable_get('@tasks').delete(task_name.to_s)
    end
  end
end
