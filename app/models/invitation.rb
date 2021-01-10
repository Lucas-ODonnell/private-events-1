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
class Invitation < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :event
end
