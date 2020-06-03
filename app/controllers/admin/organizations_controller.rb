class Admin::OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @profile = OrganizationProfile.where(organization_id: params[:id])[0]
    @organization_events = Event.where(id: OrganizationEvent.where(organization_id: params[:id]).
        pluck(:event_id), is_public: true)
    @organization_creator = OrganizationAdmin.where(organization_id: params[:id])[0]
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
    offset = rand(User.count)
    @invite_users = User.offset(offset).take(5)
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(name: organization_params[:name])

    respond_to do |format|
      if @organization.save
        @organization.organization_profile.description = organization_params[:description]
        @organization.organization_profile.banner_picture.attach(organization_params[:banner_picture])
        @organization_admin = OrganizationAdmin.new(user_id: 1, organization_id: @organization.id)
        @organization_admin.save
        @organization.organization_profile.save
        format.html { redirect_to admin_organization_path(@organization), notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(name: organization_params[:name]) and
          @profile.update(description: organization_params[:description],
                          banner_picture: organization_params[:banner_picture])
        format.html { redirect_to admin_organization_path(@organization), notice: 'Admin Organization was successfully updated.' }

      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to admin_organizations_path, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @organization = Organization.find(params[:id])
    @profile = OrganizationProfile.where(organization_id: params[:id])[0]
  end

  # Only allow a list of trusted parameters through.
  def organization_params
    params.fetch(:organization, {}).permit(:id, :name, :members, :banner_picture,
                                           :description)
  end
end
