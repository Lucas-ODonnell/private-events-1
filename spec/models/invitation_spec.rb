# == Schema Information
#
# Table name: invitations
#
#  id          :integer          not null, primary key
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  attendee_id :integer
#  event_id    :integer
#
require 'rails_helper'

RSpec.describe Invitation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
