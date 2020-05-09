class PagesController < ApplicationController
  def home
    @recent_events = Invitation.where(user_id: 1).limit(5).order("created_at desc")
    @recent_notifications = Notification.where(user_id: 1).limit(5).order("created_at desc")
  end
  def terms

  end
end
