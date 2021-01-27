# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Users can create new projects' do
  let!(:user) { FactoryBot.create(:user) }

  before do
    visit "/"
    login_as(user, scope: :user)
    visit user_path(user.id)
    click_link 'Create a New Event'
  end

  scenario 'with valid attributes' do
    fill_in 'Title', with: 'Valid Party'
    fill_in 'Location', with: 'Party House'
    fill_in 'event[start_date]', with: Time.zone.tomorrow
    fill_in 'event[start_time]', with: Time.zone.now.middle_of_day
    fill_in 'event[end_date]', with: Time.zone.tomorrow
    fill_in 'event[end_time]', with: Time.zone.now.end_of_day
    click_button 'Submit'

    expect(page).to have_content 'Your event and invitations were created!'

    event = Event.find_by!(title: 'Valid Party')
    expect(page.current_url).to eq event_url(event)
  end

  scenario 'with invalid attributes' do
    fill_in 'Title', with: 'Invalid Party'
    fill_in 'Location', with: 'Invalid House'
    fill_in 'event[start_date]', with: Time.zone.yesterday
    fill_in 'event[start_time]', with: Time.zone.now.middle_of_day
    fill_in 'event[end_date]', with: Time.zone.today
    fill_in 'event[end_time]', with: Time.zone.now.end_of_day
    click_button 'Submit'

    expect(page).to have_content '1 error prohibited this event from being saved:'
    expect(page).to have_content 'Start date must be in the future.'
  end
end
