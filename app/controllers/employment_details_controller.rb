class EmploymentDetailsController < ApplicationController
 before_action :set_employment_detail, only: [:show, :edit, :update, :destroy]
  def index
    @employment_detail = EmploymentDetail.all
  end

  # GET /EmploymentDetails/1
  # GET /EmploymentDetails/1.json
  def show
  end

  # GET /EmploymentDetails/new
  def new
    # @employment_detail = EmploymentDetail.new
  end

  # GET /EmploymentDetails/1/edit
  def edit
  end

  # POST /EmploymentDetails
  # POST /EmploymentDetails.json
  def create
    @employment_detail = EmploymentDetail.new(employment_detail_params)

    respond_to do |format|
      if @employment_detail.save
        if current_user.skills.present?
          format.html { redirect_to edit_user_skill_path(current_user.user_skill), notice: 'EmploymentDetail is successfully created.' }
        else
          format.html { redirect_to new_user_skill_path, notice: 'Employment Detail is successfully created.' }

        end
        format.json { render :show, status: :created, location: @employment_detail }
      else
        format.html { render :new }
        format.json { render json: @employment_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /EmploymentDetails/1
  # PATCH/PUT /EmploymentDetails/1.json
  def update
    respond_to do |format|
      if @employment_detail.update(employment_detail_params)
        if current_user.skills.present?
          format.html { redirect_to edit_user_skill_path(current_user.user_skill), notice: 'EmploymentDetail is successfully Updated.' }
        else
          format.html { redirect_to new_user_skill_path, notice: 'Employment Detail is successfully Updated.' }
          
        end
        format.json { render :show, status: :ok, location: @employment_detail }
      else
        format.html { render :edit }
        format.json { render json: @employment_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /EmploymentDetails/1
  # DELETE /EmploymentDetails/1.json
  def destroy
    @employment_detail.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Employment Detail is successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
      def set_employment_detail
      @employment_detail=EmploymentDetail.find(params[:id])
    end
    def employment_detail_params
      params.require(:employment_detail).permit(:user_id,:total_experience,organisations_attributes: [:id, :name, :_destroy,:employment_detail_id,:designation,:start_date,:end_date,:current_company,:job_profile,:total_experience])
    end
end

