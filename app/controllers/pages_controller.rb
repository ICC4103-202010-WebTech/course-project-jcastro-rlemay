class PagesController < ApplicationController
  def home
    @recent_events = Invitation.where(user_id: 1).limit(5).order("created_at desc")
    @recent_notifications = Notification.where(user_id: 1).limit(5).order("created_at desc")
  end
  def terms

  end
  def search
    print("holaaaaaaaaaaaaa", params)
    @user_with_name = User.where("name LIKE ? or lastName LIKE ?", "%"+params[:query].to_s+"%", "%"+params[:query].to_s+"%").limit(5)
    @user_name = UserProfile.where("userName LIKE ?", "%"+params[:query].to_s+"%").limit(5)
    @organization = Organization.where("name LIKE ?", "%"+params[:query].to_s+"%").limit(5)
    @event_title = Event.where("name LIKE ?", "%"+params[:query].to_s+"%").limit(5)
    @event_desc = Event.where("description LIKE ?", "%"+params[:query].to_s+"%").limit(5)
    @event_by_creator = Event.where(event_organizer_id: User.where("name LIKE ? or lastName LIKE ?", "%"+params[:query].to_s+"%", "%"+params[:query].to_s+"%").ids).limit(5)
    @event_by_organization = Event.find(OrganizationEvent.where(organization_id: Organization.where("name LIKE ?", "%"+params[:query].to_s+"%").ids).pluck(:event_id))
  end

end
