# == Schema Information
#
# Table name: requested_days
#
#  id                  :integer          not null, primary key
#  day                 :date             not null
#  status              :integer          default(0)
#  vacation_request_id :integer          not null
#  validator_id        :integer
#  validated_at        :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_requested_days_on_vacation_request_id  (vacation_request_id)
#  index_requested_days_on_validator_id         (validator_id)
#

require 'rails_helper'

RSpec.describe RequestedDay, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
