# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Signed-in users can sign out" do
  let!(:user) { FactoryBot.create(:user) }

  before do
    login_as(user)
  end

  scenario do
    visit "/"
    click_link "Log Out"
    expect(page).to have_content "Signed out successfully."
    expect(page).to have_content "All Upcoming Events"
  end
end
