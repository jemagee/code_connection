class Admin::UsersController < Admin::ApplicationController
  def index
  	@users = User.all
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	flash[:success] = "User Successfully Deleted!"
  	redirect_to admin_users_path
  end
end
