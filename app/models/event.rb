# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  description :text
#  end_date    :date
#  end_time    :time
#  location    :string
#  start_date  :date
#  start_time  :time
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  creator_id  :integer
#
class Event < ApplicationRecord
  validates :title, presence: true
  validates :location, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :existance_of_date_time,
           :correct_date_format,
           :start_date_must_be_in_future,
           :end_must_be_after_start

  belongs_to :creator, class_name: 'User'
  has_many :invitations, foreign_key: :event_id
  has_many :attendees, through: :invitations, source: :attendee

  scope :upcoming, -> { where('start_date >= ?', Time.zone.today) }
  scope :past, -> { where('start_date < ?', Time.zone.today) }

  private

  def existance_of_date_time
    unless end_date || end_time || start_time || start_date
      errors.add(:dates, "are invalid. Use date picker on Chrome or Firefox.")
    end
  end

  def correct_date_format
    unless valid_dates? && valid_times?
      errors.add(:dates, "are invalid. Use date picker on Chrome or Firefox.")
    end
  end

  def valid_dates?
    start_date.is_a?(Date) && end_date.is_a?(Date)
  end

  def valid_times?
    start_time.is_a?(Time) && end_time.is_a?(Time)
  end

  def start_date_must_be_in_future
    return unless errors.messages.empty?

    unless start_date > Time.zone.today
      errors.add(:start_date, "must be in the future.")
    end
  end

  def end_must_be_after_start
    return unless errors.messages.empty?

    if start_date == end_date && start_time > end_time
      errors.add(:end_time, "must be after start time.")
    elsif start_date > end_date
      errors.add(:end_date, "must be the same or after start date.")
    end
  end
end
