require 'rails_helper'

RSpec.feature "Home Page Display" do

  let!(:user) { create(:user) }
  let!(:admin) { create(:user, :admin)}

  scenario "Displays properly for non logged in users" do

    visit root_path
    expect(page).to have_content("Log In")
    expect(page).to have_content("Sign Up")
  end

  scenario "Displays properly for logged in user" do
    login_as(user)
    visit root_path

    expect(page).to_not have_content("Log In")
    expect(page).to_not have_content("Sign Up")
    expect(page).to have_content("Log out")
    expect(page).to have_content(user.username)
    expect(page).to_not have_content "Admin Home"
  end

  scenario "User logs in using email" do
    visit new_user_session_path

    fill_in "user[login]", with: user.email
    fill_in "user[password]", with: 'Password'
    click_button "Log In"

    expect(page).to have_content("Log out")
  end

  scenario "User logs in using username" do
    visit new_user_session_path

    fill_in "user[login]", with: user.username
    fill_in "user[password]", with: 'Password'
    click_button "Log In"

    expect(page).to have_content("Log out")
  end

  scenario "Admin sees link to admin home page" do
    visit new_user_session_path

    fill_in "user[login]", with: admin.username
    fill_in "user[password]", with: "Password"
    click_button "Log In"

    expect(current_url).to eq root_url
    expect(page).to have_link "Admin Home"
  end

end
