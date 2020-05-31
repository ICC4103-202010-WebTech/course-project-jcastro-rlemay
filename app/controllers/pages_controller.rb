class PagesController < ApplicationController
  def home
    @recent_events = Invitation.where(user_id: 1).limit(5).order("created_at desc")
    @recent_notifications = Notification.where(user_id: 1).limit(5).order("created_at desc")
  end
  def terms

  end
  def search
    user_with_name = User.where("name LIKE ? or lastName LIKE ?", "%"+params[:query].to_s+"%", "%"+params[:query].to_s+"%").limit(5)
    user_name = UserProfile.where("userName LIKE ?", "%"+params[:query].to_s+"%").limit(5)
    organization = Organization.where("name LIKE ?", "%"+params[:query].to_s+"%").limit(5)
    event_title = Event.where("name LIKE ?", "%"+params[:query].to_s+"%").limit(5)
    event_desc = Event.where("description LIKE ?", "%"+params[:query].to_s+"%").limit(5)
    # Nos entrega todos los usuarion con sus respectivos eventos creados.
    # Falta poner .events con un loop apra obtener los eventos de un usuario
    event_by_creator = User.find_by_sql(["SELECT * FROM (SELECT * FROM users WHERE name LIKE ? or lastName LIKE ?) a JOIN (SELECT * FROM events JOIN event_organizers ON events.event_organizer_id = event_organizers.id) q ON a.id = q.user_id", "%"+params[:query].to_s+"%", "%"+params[:query].to_s+"%"])
    event_by_organiztion = Event.find_by_sql("SELECT * FROM events JOIN (SELECT * FROM )")

  end

end
