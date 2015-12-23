class UserSkillsController < ApplicationController
  before_action :user_skill, only: [:show, :edit, :update, :destroy]
  def index
    @user_skill = UserSkill.all
  end

  # GET /UserSkills/1
  # GET /UserSkills/1.json
  def show
  end

  # GET /UserSkills/new
  def new
    @user_skill = UserSkill.new
  end

  # GET /UserSkills/1/edit
  def edit
  end

  # POST /UserSkills
  # POST /UserSkills.json
  def create
    @user_skill = UserSkill.new(user_skill_params)

    respond_to do |format|
      if @user_skill.save
          format.html { redirect_to dashboard_path, notice: 'UserSkill is successfully created.' }
        format.json { render :show, status: :created, location: @user_skill }
      else
        format.html { render :new }
        format.json { render json: @user_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /UserSkills/1
  # PATCH/PUT /UserSkills/1.json
  def update
    respond_to do |format|
      if @user_skill.update(user_skill_params)
         format.html { redirect_to dashboard_path, notice: 'UserSkill is successfully Updated.' }
        format.json { render :show, status: :ok, location: @user_skill }
      else
        format.html { render :edit }
        format.json { render json: @user_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /UserSkills/1
  # DELETE /UserSkills/1.json
  def destroy
    @user_skill.destroy
    respond_to do |format|
      format.html { redirect_to UserSkills_url, notice: 'UserSkill is successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
      def user_skill
      @user_skill=UserSkill.find(params[:id])
    end
  private

    def user_skill_params
      params.require(:user_skill).permit(:user_id,skills_attributes: [:id, :name, :_destroy,:user_skill_id])
    end
end

