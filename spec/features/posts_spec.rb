require 'rails_helper'

RSpec.feature "Projects", type: :feature do
	scenario "user creates a new blog post" do
		user = FactoryGirl.create(:user)

		visit root_path
		click_link "Sign in"
		fill_in "Email", with: user.email
		fill_in "Password", witih: user.password
		click_button "Log in"

		expect {
			click_link "New Project"
			fill_in "Name", with: "Test Project"
			fill_in "Description", with: "Trying out capybara"
			click_button "Create Project"
			}.to change(user.projects, :count).by(1)

		expect(page).to have_content "Project was successfully created"
		expect(page).to have_content "Test Project"
		expect(page).to have_content "Owner: #(user.name}"

	end
end
