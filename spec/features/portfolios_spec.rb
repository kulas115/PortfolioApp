require 'rails_helper'

RSpec.feature "Portfolios", type: :feature, js: true do
  scenario "admin creates a new portfolio" do
    admin = FactoryBot.create(:admin)
    login_as admin, scope: :user


    visit new_portfolio_path
    expect {
      fill_in "Title", with:   "Test Portfolio"
      fill_in "Content", with: "Some content"
      click_button "Save Portfolio"
    }.to change(Portfolio, :count).by(1)

    aggregate_failures do
      expect(page).to have_content "Your portfolio item is now live."
      expect(page).to have_content "Test Portfolio"
    end
  end
end
