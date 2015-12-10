class ProfilesController < ApplicationController

  before_action :authenticate_user!
   before_action :set_profile, only: [:show]
    before_action :current_user_profile, only: [:education_history,:employment_detail,:skill,:category]
  def index    
  end

  def edit
    if params[:id].present?
      @profile=Profile.find(params[:id])
     end
    current_user.profile.present? ? current_user.profile : current_user.build_profile
    @skill = current_user.skill.present? ? current_user.skill : current_user.build_skill
    @category = current_user.users_category.present? ? current_user.users_category : Category.new    
  end

  def show
    @category=[]
    @category<<@profile.user.users_category.category_ids.split(',')
  end

  def add_education
    @education_history = current_user.education_histories.new    
  end

  def add_employment
    @employment_detail = current_user.employment_details.new    
  end

  def education_history
    if params[:id].present?
      @education = current_user.education_histories.find(params[:id])
      @education.update_attributes(education_params)
    else
      @education = current_user.education_histories.create(education_params)
    end
  end

  def employment_detail
    if params[:id].present?
      @employment = current_user.employment_details.find(params[:id])
      @employment.update_attributes(employment_params)
    else
      @employment = current_user.employment_details.create(employment_params)
    end
  end

  def skill    
    if current_user.skill      
      @skill = current_user.skill.update(name: params[:name])
    else
      @skill = current_user.build_skill(name: params[:name])
      @skill.save
    end
  end

  def category
    if current_user.users_category
      current_user.users_category.update(:category_ids=>params[:category_ids].join(','))
    else
      category = current_user.build_users_category(:category_ids=>params[:category_ids].join(','))
      category.save
    end    
  end

  # GET /Profiles/new
  def new 
  end

  # GET /Profiles/1/edit

  # POST /Profiles
  # POST /Profiles.json
  def create
    @profile = current_user.build_profile(profile_params)
    @profile.save
    # flash[:notice] = "Profile created successfully." if @profile.save
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
    current_user.update_attributes(profile_params)
    @profile = current_user.profile
    # flash[:notice] = "Profile update successfully." 

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
    def current_user_profile
      @profile=current_user.profile
    end

    def profile_params
      params.require(:user).permit!
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