class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    if current_user == @user
      @events_created = Event.where(event_organizer: EventOrganizer.where(user_id: params[:id]))
      @events_invited = Event.find(Invitation.where(user_id: params[:id]).pluck(:event_id))
    else
      @events_created = Event.where(event_organizer: EventOrganizer.where(user_id: params[:id]), is_public: true)
      @events_invited = Event.where(id: Invitation.where(user_id: params[:id]).pluck(:event_id), is_public: true)
    end
    @org_admin = OrganizationAdmin.where(user_id: params[:id])[0]
    @org_member = OrganizationMember.where(user_id: params[:id])[0]

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(name: user_params[:name], lastName: user_params[:lastName],
                      location: user_params[:location],
                      address: user_params[:address])
        if user_params[:bio] != ""
          if user_params[:profile_picture] != nil
            @profile.update(bio: user_params[:bio], profile_picture: user_params[:profile_picture])
          else
            @profile.update(bio: user_params[:bio])
          end
        else
          if user_params[:profile_picture] != nil
            @profile.update(profile_picture: user_params[:profile_picture])
          end
        end

        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end

    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      @profile = UserProfile.where(user_id: params[:id])[0]
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {}).permit(:id, :name, :lastName, :password, :email,
                                     :location, :address, :phone, :bio, :profile_picture)
    end
end
