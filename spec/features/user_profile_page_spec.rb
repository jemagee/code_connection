require "rails_helper"

RSpec.feature "The User Profile Page" do

	let!(:user) {FactoryGirl.create(:user)}
	let!(:user2) {FactoryGirl.create(:user)}

	context "Logged in as the right user" do

		before {login_as(user)}

		scenario "You can visit YOUR user profile page" do

			visit user_path(user)

			expect(page).to have_content("Profile page of #{user.username}")
		end
	end
end