require "rails_helper"

RSpec.feature "Viewing the Users Index" do

	let(:admin) {create(:user, admin: true)}
	let!(:user) {create(:user)}

	before do
		login_as(admin)
	end

	scenario "From the admin root page" do

		visit admin_root_path 

		click_link "Users Index"
		expect(current_path).to eq admin_users_path
		expect(page).to have_content("List of Users")
		expect(page).to have_content(user.username)
	end
end

