require 'rails_helper'

RSpec.describe User, type: :model do
	it {should validate_presence_of(:email)}

	describe "Admin default value should be false" do

		let(:user) {User.new}

		it "should have a default admin of false" do
			expect(user.admin).to eq false
		end
	end
end
