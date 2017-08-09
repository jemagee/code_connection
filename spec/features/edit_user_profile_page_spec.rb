require 'rails_helper'

RSpec.feature "Edting a users profile" do

	let(:user) {FactoryGirl.create(:user)}
	let(:user2) {FactoryGirl.create(:user)}

	context "Logged in as the proper user" do

		before {login_as(user)}

		scenario "can access the edit page" do

			visit edit_user_path(user)

			expect(page).to have_content("Edit Your Profile - #{user.username}")

		end
	end

	context "Logged in as the improper user" do
		before {login_as(user2)}

		scenario "can not acess the users edit page" do

			visit edit_user_path(user)

			expect(page).to have_content("You don't have access to that page")
			expect(page).to_not have_content(user.username)
			expect(current_path).to eq root_path
		end
	end
end