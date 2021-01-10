# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  description :text
#  end_time    :datetime
#  location    :string
#  start_time  :datetime
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  creator_id  :integer
#
class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitations
  has_many :attendees, through: :invitations
end
