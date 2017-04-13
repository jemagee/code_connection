require 'rails_helper'

RSpec.describe User, type: :model do
	it {should validate_presence_of(:email)}
	it {should validate_presence_of(:username)}

	describe "Admin default value should be false" do

		let(:user) {User.new}

		it "should have a default admin of false" do
			expect(user.admin).to eq false
		end
	end

  describe "Username validation" do
    let!(:existing_user) { create(:user, username: 'user_1') }
    let(:user) { build(:user, email: 'u@u.com') }

    it "should be unique" do
      user.username = 'unique_user'
      expect(user).to be_valid
    end

    it "should be invalid when username exists" do
      user.username = 'user_1'
      expect(user).not_to be_valid
    end

    it "should be case insensitive" do
      user.username = 'USER_1'
      expect(user).not_to be_valid
    end

    it "should consist of letters, numbers and underscores" do
      user.username = 'user name'
      expect(user).not_to be_valid

      user.username = 'user$name'
      expect(user).not_to be_valid
    end

    it "should be at least 6 characters" do
      user.username = 'user'
      expect(user).not_to be_valid
    end
  end
end
