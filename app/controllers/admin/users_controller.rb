class Admin::UsersController < Admin::ApplicationController
  def index
  	@users = User.all
  end
end
