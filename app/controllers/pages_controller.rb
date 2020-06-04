class PagesController < ApplicationController
  def home
    @recent_events = Invitation.where(user_id: 1).limit(5).order("created_at desc")
    @recent_notifications = Notification.where(user_id: 1).limit(5).order("created_at desc")
  end
  def terms

  end
  def search
    print("holaaaaaaaaaaaaa", params[:query])
    @users_by_name = User.where("name LIKE ? or lastName LIKE ?", "%"+params[:query].to_s+"%", "%"+params[:query].to_s+"%").limit(5)
    @users_by_username = User.where(id: UserProfile.where("userName LIKE ?", "%"+params[:query].to_s+"%").pluck(:user_id)).limit(5)
    @organizations_by_name = Organization.where("name LIKE ?", "%"+params[:query].to_s+"%").limit(5)
    @events_by_title = Event.where("name LIKE ?", "%"+params[:query].to_s+"%").limit(5)
    @events_by_desc = Event.where("description LIKE ?", "%"+params[:query].to_s+"%").limit(5)
    @events_by_creator = Event.where(event_organizer_id: User.where("name LIKE ? or lastName LIKE ?", "%"+params[:query].to_s+"%", "%"+params[:query].to_s+"%").ids).limit(5)
    @events_by_organization = Event.find(OrganizationEvent.where(organization_id: Organization.where("name LIKE ?", "%"+params[:query].to_s+"%").ids).pluck(:event_id))
  end

end
