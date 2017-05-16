require 'rails_helper'

RSpec.describe Admin::ApplicationController, type: :controller do
	let(:user) {create(:user)}

	before do
		allow(controller).to receive(:current_user).and_return(user)
		allow(controller).to receive(:authenticate_user!)
	end

  context "Users who are not admins" do
  	it "are not able to access the admin root path (admin#index)" do
  		get :index
  		expect(response).to redirect_to "/"
  		expect(flash[:alert]).to eq "You do not have access to that page!"
  	end
  end
end
