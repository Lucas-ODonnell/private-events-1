# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Users can sign in" do
  let!(:user) { FactoryBot.create(:user) }

  scenario "with valid credentials" do
    visit "/"
    click_link "Log In"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log In"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "My Parties"
  end
end
