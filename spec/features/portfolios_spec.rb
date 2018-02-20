require 'rails_helper'

RSpec.feature "Portfolios", type: :feature, js: true, slow: true do
  scenario "admin creates a new portfolio" do
    admin = FactoryBot.create(:admin)
    login_as admin, scope: :user


    visit new_portfolio_path
    expect {
      fill_in "Title", with:   "Test Portfolio"
      fill_in "Content", with: "Some content"
      attach_file "portfolio[main_image]", "#{Rails.root}/spec/files/test.png"
      attach_file "portfolio[thumb_image]", "#{Rails.root}/spec/files/test.png"
      click_button "Save Portfolio"
    }.to change(Portfolio, :count).by(1)

    # byebug

    aggregate_failures do
      expect(page).to have_content "Your portfolio item is now live."
      expect(page).to have_content "Test Portfolio"
      expect(page).to have_css ("img[src*='test.png']")
    end

    click_link "Test Portfolio"
    expect(page).to have_css ("img[src*='test.png']")
  end
end
