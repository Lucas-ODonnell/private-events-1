# frozen_string_literal: true

require "rails_helper"

RSpec.feature "Users can sign up" do
  scenario "when providing valid details" do
    visit "/"
    click_link "Sign Up"
    fill_in "Name", with: "Example User"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign Up"

    expect(page).to have_content "You have signed up successfully."
    expect(page).to have_content "My Parties"
  end
end
