class Admin::ApplicationController < ApplicationController

	before_action :check_user
  
  def index

  end

  private 

  def check_user
  	authenticate_user!

  	if !current_user.admin?
  		redirect_to root_path, alert: "You do not have access to that page!"
  	end
  end

end
