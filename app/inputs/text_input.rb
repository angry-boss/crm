# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
class TextInput < SimpleForm::Inputs::TextInput
  def input(wrapper_options)
    @builder.text_area(attribute_name, { rows: 7 }.merge(merge_wrapper_options(input_html_options, wrapper_options)))
  end

  ActiveSupport.run_load_hooks(:crm_text_input, self)
end
