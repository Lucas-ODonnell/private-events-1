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
  belongs_to :attendee, foreign_key: :attendee_id, class_name: 'User'
  belongs_to :event, foreign_key: :event_id, inverse_of: :invitations
end
