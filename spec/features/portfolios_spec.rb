require 'rails_helper'

RSpec.feature "Portfolios", type: :feature, js: true do
  scenario "admin creates a new portfolio" do
    admin = FactoryBot.create(:admin)

    visit root_path
    click_link "Login"
    fill_in "Email",    with: admin.email
    fill_in "Password", with: admin.password
    click_button "Log in"

    visit new_portfolio_path
    expect {
      fill_in "Title", with:   "Test Portfolio"
      fill_in "Content", with: "Some content"
      click_button "Save Portfolio"

      expect(page).to have_content "Your portfolio item is now live."
      expect(page).to have_content "Test Portfolio"
    }.to change(Portfolio, :count).by(1)
  end
end
