require 'rails_helper'

RSpec.feature "Deleting a User" do 

	let(:admin) {create(:user, admin: true)}
	let!(:user) {create(:user)}
	let!(:user2) {create(:user)}

	before do
		login_as(admin)
		visit admin_users_path
	end

	scenario "Works Properly" do

		within("div##{user.id}") do
			click_link "Delete User"
		end

		expect(page).to have_content "User Successfully Deleted!"
		expect(page).to have_content user2.username
		expect(page).to_not have_content user.username
	end
end