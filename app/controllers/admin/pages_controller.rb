class Admin::PagesController < ApplicationController
  def home
  end
  def reports
    @user_reports = Report.all
    @event_reports = EventReport.all
    @org_reports = OrganizationReport.all
  end
end
