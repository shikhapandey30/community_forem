class ProfilesController < ApplicationController

 # before_action :set_profile, only: [:show, :edit, :update, :destroy]
  def index
    @profile = current_user.profile.present? ? current_user.profile : current_user.build_profile
    @skill = current_user.skill.present? ? current_user.skill : current_user.build_skill
    @education_history = current_user.education_histories.new
    @employment_detail = current_user.employment_details.new    
    @category = current_user.users_categories.present? ? current_user.users_categories : Category.new
    # @skills = Skill.all
    # @categories = Category.all
    # if current_user.profile.present?
    #   redirect_to edit_profile_path(current_user.profile)
    # else
    #   redirect_to new_profile_path 
    # end
  end

  # GET /Profiles/1
  # GET /Profiles/1.json
  def show
  end

  def education_history
    if params[:id].present?
      @education = EducationHistory.find(params[:id])
    else
      @education = current_user.education_histories.create(education_params)
    end
  end

  def employment_detail
    if params[:id].present?
      @employment = EmploymentDetail.find(params[:id])
    else
      @employment = current_user.employment_details.create(employment_params)
    end
  end

  def skill

  end

  def category
    
  end

  # GET /Profiles/new
  def new 
  end

  # GET /Profiles/1/edit
  def edit
  end

  # POST /Profiles
  # POST /Profiles.json
  def create
    @profile = current_user.build_profile(profile_params)
    @profile.save
    # @profile = current_user.build_profile(profile_params)
    # @profile.save
    # redirect_to :back

    # respond_to do |format|
    #   if @profile.save
    #     if @profile.profile_type=='Individual'
    #       if current_user.education_history.present?
    #        format.html { redirect_to edit_education_history_path(current_user.education_history), notice: 'Profile was successfully created.' }
    #       else
    #        format.html { redirect_to new_education_history_path(@profile), notice: 'Profile was successfully created.' }
    #       end
    #     else
    #       if current_user.employment_detail.present?
    #        format.html { redirect_to edit_employment_detail_path(current_user.employment_detail), notice: 'Profile was successfully created.' }
    #       else
    #        format.html { redirect_to new_employment_detail_path(@profile), notice: 'Profile was successfully created.' }
    #       end
    #     end
    #     format.json { render :show, status: :created, location: @profile }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @profile.errors, status: :unprocessable_entity }
    #   end
    # end
  end


  # PATCH/PUT /Profiles/1
  # PATCH/PUT /Profiles/1.json

  def update
    current_user.profile.update(profile_params)

    # respond_to do |format|
    #   if @profile.update(profile_params)
    #      if @profile.profile_type=='Individual'
    #       if current_user.education_history.present?
    #        format.html { redirect_to edit_education_history_path(current_user.education_history), notice: 'Profile was successfully created.' }
    #       else
    #        format.html { redirect_to new_education_history_path, notice: 'Profile was successfully created.' }
    #       end
    #     else
    #       if current_user.employment_detail.present?
    #        format.html { redirect_to edit_employment_detail_path(current_user.employment_detail), notice: 'Profile was successfully created.' }
    #       else
    #        format.html { redirect_to new_employment_detail_path, notice: 'Profile was successfully created.' }
    #       end
    #     end
    #     format.json { render :show, status: :ok, location: @profile }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @profile.errors, status: :unprocessable_entity }
    #   end
    # end
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
      params.require(:profile).permit!
    end

    def education_params
      params.require(:education_history).permit!
    end

    def employment_params
      params.require(:employment_detail).permit!
    end

    def category_params
      params.require(:education_history).permit!
    end
end