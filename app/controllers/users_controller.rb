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

	def update
		@user = User.find(params[:id])
		@user.update_attributes(user_params)
		flash[:success] = "Your profile has been updated"
		redirect_to @user
	end

	private

		def user_params
			params.require(:user).permit(:country_code)
		end
end
