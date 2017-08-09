class UsersController < ApplicationController

	def show
		if params[:id].to_i == current_user.id
			@user = User.find(params[:id])
		else
			flash[:danger] = "You do not have access to that page"
			redirect_to root_path
		end
	end
end
