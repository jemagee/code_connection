require "rails_helper"

RSpec.feature "Admin editing of a user" do

	let(:admin) {create(:user, admin: true)}
	let!(:user) {create(:user)}
	let!(:user2) {create(:user)}

	before do
		login_as(admin)
		visit admin_users_path
		within("div##{user2.id}") do
			click_link "Edit User"
		end
	end

	scenario "works properly" do 
		fill_in "user[username]", with: "NewUserName"

		click_button "Update User"

		expect(page).to have_content("User Successfully Updated")
		expect(current_url).to eq admin_root_url
	end

	scenario "errors properly when necessary" do
		fill_in "user[username]", with: user.username

		click_button "Update User"

		expect(page).to have_content("User Not Updated")
		expect(page).to have_content("Username has already been taken")
	end


end