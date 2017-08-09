class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	def edit
		if current_user.id == params[:id].to_i
			@user = User.find(params[:id])
		else
			flash[:danger] = "You don't have access to that page"
			redirect_to root_path
		end
	end
end
