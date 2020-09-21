class UsersController < ApplicationController

  def show
    if current_user == User.find(params[:id]) || current_user.is_admin == true
      @user = User.find(params[:id])
      @user_all_events = @user.events
    else
      redirect_to root_path
    end
  end

  def index

  end

end
