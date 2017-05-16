require 'rails_helper'

RSpec.feature "Adding a new skill" do

	let(:admin) {create(:user, admin: true)}

	before do
		login_as(admin)
		visit new_admin_skill_path
	end

	scenario "Creating a new skill" do

		fill_in "skill[name]", with: "Ruby on Rails"

		click_button "Add Skill"

		expect(page).to have_content("The skill was added")
		expect(page).to have_content("Ruby on Rails")
	end

	scenario "Submitting a blank name" do

		click_button "Add Skill"

		expect(page).to have_content("The skill was not added")
		expect(page).to have_content("Name can't be blank")
	end

	scenario "Submitting a name that already exists" do
		Skill.create(name: "PyTHon")

		fill_in "skill[name]", with: "pytHON"
		click_button "Add Skill"
		expect(page).to have_content("The skill was not added")
		expect(page).to have_content("Name has already been taken")
	end
end