class PagesController < ApplicationController
  def home
    @recent_events = Invitation.where(user_id: 1).limit(5).order("created_at desc")
    @recent_notifications = Notification.where(user_id: 1).limit(5).order("created_at desc")
  end
  def terms

  end
  def search
    @user_with_name = User.where("name LIKE ? or lastName LIKE ?", "%"+params[:query].to_s+"%", "%"+params[:query].to_s+"%").limit(5)
    @user_name = UserProfile.where("userName LIKE ?", "%"+params[:query].to_s+"%").limit(5)
    @organization = Organization.where("name LIKE ?", "%"+params[:query].to_s+"%").limit(5)
    @event_title = Event.where("name LIKE ?", "%"+params[:query].to_s+"%").limit(5)
    @event_desc = Event.where("description LIKE ?", "%"+params[:query].to_s+"%").limit(5)
    # Nos entrega todos los usuarios que sean EventOrganizers.
    # Falta poner .event_organizer.events con un loop apra obtener los eventos de un usuario
    @event_by_creator = Event.where(event_organizer_id: User.where("name LIKE ? or lastName LIKE ?", "%"+params[:query].to_s+"%", "%"+params[:query].to_s+"%").ids)
    @event_by_organiztion = Organization.where("name LIKE ?", "%"+params[:query].to_s+"%")

  end

end
