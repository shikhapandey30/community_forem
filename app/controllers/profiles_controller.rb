class ProfilesController < ApplicationController
 before_action :set_profile, only: [:show, :edit, :update, :destroy]
  def index
    @profiles = Profile.all
  end

  # GET /Profiles/1
  # GET /Profiles/1.json
  def show
  end

  # GET /Profiles/new
  def new
    @profile = Profile.new
  end

  # GET /Profiles/1/edit
  def edit
  end

  # POST /Profiles
  # POST /Profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to new_education_history_path(@profile), notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /Profiles/1
  # PATCH/PUT /Profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        if current_user.education_history.present?
          format.html { redirect_to edit_education_history_path(current_user.education_history), notice: 'Profile was successfully updated.' }
        else
          format.html { redirect_to new_education_history_path, notice: 'Profile was successfully updated.' }
        end
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Profiles/1
  # DELETE /Profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to Profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    def set_profile
      @profile=Profile.find(params[:id])
    end
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :user_id, :gender, :image, :phone_no, :location, :dob, :screen_name, :specialization_id, :street, :post_code, :city, :country)
    end
end

