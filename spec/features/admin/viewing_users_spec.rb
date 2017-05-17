require "rails_helper"

RSpec.feature "Viewing the Users Index" do

	let(:admin) {create(:user, admin: true)}
	let!(:user) {create(:user)}
	let!(:admin2) {create(:user, admin: true)}

	before do
		login_as(admin)
		visit admin_root_path
		click_link "Users Index"
	end

	scenario "From the admin root page" do

		visit admin_root_path 

		click_link "Users Index"
		expect(current_path).to eq admin_users_path
		expect(page).to have_content("List of Users")
		expect(page).to have_content(user.username)
		expect(page).to have_content(admin.username)
	end

	scenario "THere is a delete link for non admin users" do

		within("div##{user.id}") do
			expect(page).to have_link "Delete User"
		end
	end

	scenario "There is not a delete link for logged in admin user" do

		within("div##{admin.id}") do
			expect(page).to_not have_content("Delete User")
		end
	end

	scenario "There is not a delete link for not logged in admin user" do

		within("div##{admin2.id}") do
			expect(page).to_not have_content("Delete User")
		end
	end
end

