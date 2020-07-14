# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TasksHelper do
  describe "responding with generated links" do
    before do
      @task = create(:task)
    end

    it "should render link to uncomplete of a task" do
      expect(link_to_task_uncomplete(@task, nil)).to include(t(:task_uncomplete))
    end
  end
end
