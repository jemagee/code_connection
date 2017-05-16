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

	context "When logged in as the admin" do

		before {login_as(admin)}

		scenario "Can access the home page" do

			visit admin_root_path

			expect(current_path).to eq admin_root_path
			expect(page).to_not have_content("You do not have access to that page!")
		end
	end

	context "When not logged in at all" do

		scenario "Gets sent to the sign in page" do

			visit admin_root_path
			
			expect(current_path).to eq new_user_session_path
		end
	end
end
