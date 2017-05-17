class Admin::UsersController < Admin::ApplicationController

	before_action :get_user, only: [:edit, :destroy, :update]
  def index
  	@users = User.all
  end

  def edit
  end

  def destroy
  	@user.destroy
  	flash[:success] = "User Successfully Deleted!"
  	redirect_to admin_users_path
  end

  def update
  	if @user.update(user_params)
  		flash[:success] = "User Successfully Updated!"
  		redirect_to admin_root_path
  	else
  		flash[:warning] = "User Not Updated"
  		render "edit"
  	end
  end

  private 

  	def user_params
  		params.require(:user).permit(:email, :username)
  	end

  	def get_user
  		@user = User.find(params[:id])
  	end
end
