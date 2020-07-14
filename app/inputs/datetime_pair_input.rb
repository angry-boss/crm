# frozen_string_literal: true


#
# CRM is freely distributable under the terms of MIT license.
# See MIT-LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
class DatetimePairInput < DatePairInput
  private

  # Tell datepicker this is a datetime
  #------------------------------------------------------------------------------
  def input_html_classes
    classes = super.dup
    classes.delete('date')
    classes.push('datetime')
  end

  # Return value recognised by datepicker and ensure timezone properly set by AR
  #------------------------------------------------------------------------------
  def value(field)
    val = object.send(field.name)
    val.present? ? val.strftime('%Y-%m-%d %H:%M') : nil
  end

  ActiveSupport.run_load_hooks(:crm_datetime_pair_input, self)
end
