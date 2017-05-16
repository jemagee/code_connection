require 'rails_helper'

RSpec.feature "Adding a new skill" do

	let(:admin) {create(:user, admin: true)}

	before {login_as(admin)}

	scenario "Creating a new skill" do

		visit new_admin_skill_path

		fill_in "skill[name]", with: "Ruby on Rails"

		click_button "Add Skill"

		expect(page).to have_content("The skill was added")
		expect(page).to have_content("Ruby on Rails")
	end
end