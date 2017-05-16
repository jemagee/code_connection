require 'rails_helper'

RSpec.feature "Testing Access to the admin homepage" do

	let!(:user) {FactoryGirl.create(:user)}
	let!(:admin) {FactoryGirl.create(:user, admin: true)}

	context "when logged in as the user" do

		before {login_as(user)}

		scenario "Can't visit the admin homepage" do

			visit admin_root_path

			expect(current_path).to eq root_path
			expect(page).to have_content("You do not have access to that page!")
		end
	end
end
