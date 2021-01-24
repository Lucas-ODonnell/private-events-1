# frozen_string_literal: true

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
  belongs_to :creator, class_name: 'User'
  has_many :invitations, dependent: :destroy
  has_many :attendees, through: :invitations, source: :attendee

  validates :title, presence: true
  validates :location, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :existance_of_date_time,
           :correct_date_format,
           :start_date_must_be_in_future,
           :end_must_be_after_start

  scope :upcoming, -> { where('start_date >= ?', Time.zone.today) }
  scope :past, -> { where('start_date < ?', Time.zone.today) }

  private

    def existance_of_date_time
      return if end_date && end_time && start_time && start_date

      errors.add(:dates, "are invalid. Use date picker on Chrome or Firefox.")
    end

    def correct_date_format
      valid_date_format
      valid_time_format
    end

    def valid_date_format
      return if start_date.is_a?(Date) && end_date.is_a?(Date)

      errors.add(:dates, "are invalid. Use date picker on Chrome or Firefox.")
    end

    def valid_time_format
      return if start_time.is_a?(Time) && end_time.is_a?(Time)

      errors.add(:times, "are invalid. Use time picker on Chrome or Firefox.")
    end

    def start_date_must_be_in_future
      return unless errors.messages.empty?

      errors.add(:start_date, "must be in the future.") unless start_date > Time.zone.today
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
