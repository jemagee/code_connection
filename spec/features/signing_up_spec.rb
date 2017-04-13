require 'rails_helper'

RSpec.feature "Testing the Sign Up Function of Devise" do

	before {visit new_user_registration_path}

	context "with a unique email address" do

		scenario "successfully signs up" do

			fill_in "user[email]", with: "test@example.com"
			fill_in "user[username]", with: "test_user"
			fill_in "user[password]", with: "password"
			fill_in "user[password_confirmation]", with: "password"

			click_button "Sign up"

			expect(page).to have_content("You have signed up successfully")
			expect(current_url).to eq root_url
		end
	end

	context "with an already registered email" do
		let!(:user) {FactoryGirl.create(:user)}

		scenario "fails the sign up" do

			fill_in "user[email]", with: user.email
			fill_in "user[password]", with: "password"
			fill_in "user[password_confirmation]", with: "password"

			click_button "Sign up"

			expect(page).to have_content("Email has already been taken")
			expect(current_url).to_not eq root_url
		end
	end
end
