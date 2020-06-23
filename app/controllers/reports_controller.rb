class ReportsController < ApplicationController
  def user
    @report = Report.new(reason: params[:reason], reporter_id: current_user.id, reported_id: params[:id])
    respond_to do |format|
      if @report.save
        format.html { redirect_to @report.reported, notice: 'report successfully sent.' }
      else
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def event
    @report = EventReport.new(reason: params[:reason], user_id: current_user.id, event_id: params[:id])
    respond_to do |format|
      if @report.save
        format.html { redirect_to @report.event, notice: 'report successfully sent.' }
      else
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def organization
    @report = OrganizationReport.new(reason: params[:reason], user_id: current_user.id, organization_id: params[:id])
    respond_to do |format|
      if @report.save
        format.html { redirect_to @report.organization, notice: 'report successfully sent.' }
      else
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end
end
