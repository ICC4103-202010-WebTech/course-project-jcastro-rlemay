class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = Organization.all
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @profile = OrganizationProfile.where(organization_id: params[:id])[0]
    @organization_events = Event.where(event_organizer_id: EventOrganizer.where(
        user_id: OrganizationMember.where(organization_id: params[:id]).pluck(
            :user_id)), is_public: true)

    @organization_creator = OrganizationAdmin.where(organization_id: params[:id])[0]
    @organization_members = OrganizationMember.where(organization_id: params[:id])
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
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
        @organization.organization_profile.description = organization_params[:organization_profile_attributes][:description]
        @organization.organization_profile.banner_picture.attach(organization_params[:organization_profile_attributes][:banner_picture])
        @organization_admin = OrganizationAdmin.new(user_id: current_user.id, organization_id: @organization.id)
        @organization_admin.save
        @organization.organization_profile.save
        format.html { redirect_to organization_path(@organization), notice: 'Organization was successfully created.' }
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
      if @organization.update(name: organization_params[:name])
        if organization_params[:organization_profile_attributes][:banner_picture]!=nil
          if organization_params[:organization_profile_attributes][:description]== ""
            @profile.update(banner_picture: organization_params[:organization_profile_attributes][:banner_picture])
          else
            @profile.update(description: organization_params[:organization_profile_attributes][:description],
                            banner_picture: organization_params[:organization_profile_attributes][:banner_picture])
          end

        else
          if organization_params[:organization_profile_attributes][:description] != ""
            @profile.update(description: organization_params[:organization_profile_attributes][:description])
          end
        end
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy!
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def invites
    members = OrganizationMember.all.pluck(:user_id)
    admins = OrganizationAdmin.all.pluck(:user_id)
    admins.each do |admin|
      members << admin
    end
    @pagy, @invites = pagy(User.where.not(id: members))
    if params[:invitation] != nil
      @notification = Notification.new(user_id: params[:invitation], message: "You were invited to an Organization!")
      @new_member = OrganizationMember.new(user_id: params[:invitation],organization_id: params[:id])
      if @new_member.save
        redirect_to invites_organization_path, notice: @new_member.user.name+ " "+ @new_member.user.lastName + " was invited"
      end
    end
  end

  def delete_member
    @member = OrganizationMember.find(params[:member])
    if @member.destroy
      respond_to do |format|
        format.html { redirect_to organization_path(@organization), notice: 'uninvited guest.' }
        format.json { head :no_content }
      end
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
      params.fetch(:organization, {}).permit(:id, :name, :members,
                                             organization_profile_attributes: [:banner_picture, :description])
    end
end
