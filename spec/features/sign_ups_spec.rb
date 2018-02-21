require 'rails_helper'

RSpec.feature "SignUps", type: :feature, js: true do
  include ActiveJob::TestHelper

  scenario "user successfully signs up" do
    visit root_path
    click_link "Registration"

    perform_enqueued_jobs do
      expect {
        fill_in "Name",                  with: "User Name"
        fill_in "Email",                 with: "test@example.com"
        fill_in "Password",              with: "foobar"
        fill_in "Password confirmation", with: "foobar"
        click_button "Sign up"
      }.to change(User, :count).by(1)

      expect(page).to have_content "Welcome! You have signed up successfully."
      expect(current_path).to eq root_path
      expect(page).to have_content "Logout"

      mail = ActionMailer::Base.deliveries.last

      # byebug

      aggregate_failures do
        expect(mail.to).to eq      ["test@example.com"]
        expect(mail.from).to eq    ["support@example.com"]
        expect(mail.subject).to eq "Welcome to my site!"
        expect(mail.body).to match "Hello User,"
        expect(mail.body).to match "test@example.com"
      end
    end
  end
end
