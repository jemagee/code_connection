class Admin::UsersController < Admin::ApplicationController
  def index
  	@users = User.all
  end

  def edit
  	@user = User.find(params[:id])
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	flash[:success] = "User Successfully Deleted!"
  	redirect_to admin_users_path
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	flash[:success] = "User Successfully Updated"
  	redirect_to admin_root_path
  end

  private 

  	def user_params
  		params.require(:user).permit(:email, :username, :password, :password_confirmation)
  	end
end
