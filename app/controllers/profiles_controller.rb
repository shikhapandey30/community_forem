class ProfilesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_profile, only: [:show]
  before_action :current_user_profile, only: [:education_history,:employment_detail,:skill,:category]
  def index    
  end

  def edit
    @user = User.find(params[:id])    
    current_user.profile.present? ? current_user.profile : current_user.build_profile
    @skill = current_user.skill.present? ? current_user.skill : current_user.build_skill
    @category = current_user.users_category.present? ? current_user.users_category : Category.new    
  end

  def show
    @category = @user.users_category
    @user_categories =  @category.present? ? @category.category_ids.split(',') : []
    # @category=[]
    # @category<<@user.users_category.category_ids.split(',') rescue nil
  end

  def add_education
    @education_history = current_user.education_histories.new    
  end

  def update_education_history
    @user = current_user
    @education_histories = EducationHistory.find(params[:id])
    @education_histories.update(education_params)
     @success = "Education History update Succesfully." 
    render 'education_history'
  end

  def update_employment_detail
    @user = current_user
    @employment_detail = EmploymentDetail.find(params[:id])
    @employment_detail.update(employment_params)
     @success = "Employment History update Succesfully." 
    render 'employment_detail'
  end

  def add_employment
    @employment_detail = current_user.employment_details.new    
  end

  def education_history
    if params[:id].present?
      @education = current_user.education_histories.find(params[:id])
      @success = "Education History update Succesfully." if @education.update_attributes(education_params)
    else
      @education = current_user.education_histories.create(education_params)
      @success = "Education History create Succesfully."
    end
    @user=current_user
  end

  def employment_detail    
    if params[:id].present?
      @success = "Employment Detail update Succesfully."
      @employment = current_user.employment_details.find(params[:id])
      @employment.update_attributes(employment_params)
    else
      @employment = current_user.employment_details.create(employment_params)
      @success = "Employment Detail create Succesfully."
    end
    @user=current_user
  end

  def skill    
    if current_user.skill
      @before_changed = current_user.skill.try(:name)
      @skill = current_user.skill.update(name: params[:name])
      @after_changed = current_user.skill.try(:name)
      @success = "Skill update Succesfully."      
    elsif params[:name].present?
      @skill = current_user.build_skill(name: params[:name])
      @before_changed = "1"
      @after_changed = "2"
      @success = "Skill create Succesfully." if @skill.save
    else
      render :nothing => true, :status => 200
    end
  end

  def category
    if current_user.users_category
       @before_changed = current_user.users_category.try(:category_ids)
       categories_ids = params[:category_ids].present? ? params[:category_ids].join(', ') : []
      current_user.users_category.update(:category_ids=>categories_ids) 
      @after_changed = current_user.users_category.try(:category_ids)
      @success = "Category update Succesfully."
    elsif params[:category_ids].present?
      @before_changed = "1"
      @after_changed = "2"
      category = current_user.build_users_category(:category_ids=>params[:category_ids].join(', '))
      @success = "Category update Succesfully." if category.save
    else
      render :nothing => true, :status => 200
    end    
  end

  # GET /Profiles/new
  def new 
  end

  # GET /Profiles/1/edit

  # POST /Profiles
  # POST /Profiles.json
  def create
    # @profile = current_user.build_profile(profile_params)
    # @success = "Profile create Succesfully." if @profile.save
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
    success = current_user.profile ? "Profile update Succesfully." : "Profile create Succesfully."
    @success = success if current_user.update_attributes(profile_params)
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
      @user=User.find(params[:id])
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