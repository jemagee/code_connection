require "rails_helper"

RSpec.feature "The User Profile Page" do

	let!(:user) {FactoryGirl.create(:user)}
	let!(:user2) {FactoryGirl.create(:user)}

	context "Logged in as the right user" do

		before {login_as(user)}

		scenario "can be viewed" do

			visit user_path(user)

			expect(page).to have_content("Profile page of #{user.username}")
			expect(page).to have_link("Edit Your Profile")
		end
	end

	context "Logged in as another user" do

		before {login_as(user2)}

		scenario "can not view edit link" do

			visit user_path(user)
			expect(page).to have_content("Profile page of #{user.username}")
			expect(page).to_not have_link("Edit Your Profile")
		end
	end
end