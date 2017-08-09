require "rails_helper"

RSpec.feature "The User Profile Page" do

	let!(:user) {FactoryGirl.create(:user)}
	let!(:user2) {FactoryGirl.create(:user)}

	context "Logged in as the right user" do

		before {login_as(user)}

		scenario "can be viewed" do

			visit user_path(user)

			expect(page).to have_content("Profile page of #{user.username}")
		end
	end

	context "Logged in as the wrong user" do

		before {login_as(user2)}

		scenario "can not be viewed" do

			visit user_path(user)
			expect(page).to have_content("You do not have access to that page")
			expect(page).to_not have_content("Profile page of #{user.username}")
		end
	end
end