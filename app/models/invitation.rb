# frozen_string_literal: true

# == Schema Information
#
# Table name: invitations
#
#  id          :integer          not null, primary key
#  status      :integer          default("no_response")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  attendee_id :integer
#  event_id    :integer
#
class Invitation < ApplicationRecord
  belongs_to :attendee, class_name: 'User'
  belongs_to :event

  enum status: {
    no_response: 1,
    attending: 2,
    not_attending: 3
  }
end
