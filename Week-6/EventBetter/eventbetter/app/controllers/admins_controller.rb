class AdminsController < ApplicationController

  def index
    if current_user == nil || current_user.is_admin == false
      redirect_to 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
    end
    @all_users = User.all
    @all_events = Event.all
  end

  def create
    @event = Event.find(params[:event_id])
    if params[:answer] == "true"
      @event.update(is_validated?: true)
    elsif params[:answer] == "delete"
      delete()
    end
    redirect_to admins_path
  end

  def edit
    @user = User.find(params[:id]).destroy
    redirect_to admins_path
  end

  def delete
    Event.find(params[:event_id]).destroy
  end

end
