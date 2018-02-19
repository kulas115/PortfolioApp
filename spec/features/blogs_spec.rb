require 'rails_helper'

RSpec.feature "Blogs", type: :feature, js: true do
  scenario "admin creates a new blog" do
    admin = FactoryBot.create(:admin)
    topic = FactoryBot.create(:topic)
    login_as admin, scope: :user
    # sign_in_as admin

    visit blogs_path
    click_link "Write a New Blog"
    expect {
      fill_in "Title", with:   "Test Blog"
      select 'Rails', from: "blog[topic_id]"
      fill_in "Content", with: "Some content"
      click_button "Submit"

      expect(page).to have_content "Blog was successfully created."
      expect(page).to have_content "Test Blog"
    }.to change(Blog, :count).by(1)
  end
end
