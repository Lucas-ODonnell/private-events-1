# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    title { "Example Party" }
    location { "Example House" }
    start_date { Time.zone.tomorrow }
    start_time { Time.zone.now.middle_of_day }
    end_date { Time.zone.tomorrow }
    end_time { Time.zone.now.end_of_day }
    association :creator, factory: :user
  end
end
