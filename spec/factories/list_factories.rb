# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
FactoryBot.define do
  factory :list do
    name { "Foo List" }
    url { "/controller/action" }
  end
end
