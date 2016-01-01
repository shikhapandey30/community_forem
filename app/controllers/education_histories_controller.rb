class EducationHistoriesController < ApplicationController

  # filters
  before_action :set_education_history, only: [:show, :edit, :update, :destroy]

  # fetching all education history
  def index
    @education_histories = EducationHistory.all
  end

  # GET /EducationHistorys/1
  # GET /EducationHistorys/1.json
  def show
  end

  # GET /EducationHistorys/new
  def new
    # @education_history = EducationHistory.new
  end

  # GET /EducationHistorys/1/edit
  def edit
  end

  # POST /EducationHistorys
  # POST /EducationHistorys.json
  def create
    # @education_history = EducationHistory.new(education_history_params)

    # respond_to do |format|
    #   if @education_history.save
    #     if current_user.employment_detail.present?
    #       format.html { redirect_to edit_employment_detail_path(current_user.employment_detail), notice: 'EducationHistory is successfully created.' }
    #     else
    #       format.html { redirect_to new_employment_detail_path, notice: 'EducationHistory is successfully created.' }

    #     end
    #     format.json { render :show, status: :created, location: @education_history }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @education_history.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # updating education history for update
  def update
    # respond_to do |format|      
      # if
      current_user.update(education_params)
      @success = "Education History updated successfully." 

      redirect_to :back
        # if current_user.employment_detail.present?
        #   format.html { redirect_to edit_employment_detail_path(current_user.employment_detail) , notice: 'EducationHistory is successfully updated.' }
        # else
        #    format.html { redirect_to new_employment_detail_path , notice: 'EducationHistory is successfully updated.' }
        # end
         # format.json { render :show, status: :ok, location: @education_history }
      # else
        # format.html { render :edit }
        # format.json { render json: @education_history.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # deleting education history
  def destroy
    @education_history.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'EducationHistory is successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # setting education history for all actions
    def set_education_history      
      @education_history=EducationHistory.find(params[:id])      
    end

    # permitting education history parameters
    def education_history_params
      params.require(:education_history).permit(:user_id, :specialization_id,courses_attributes: [:id, :name, :_destroy,:education_history_id],institutes_attributes: [:id, :name, :_destroy,:education_history_id])
    end
    def education_params
      params.require(:education_history).permit!
    end
end

