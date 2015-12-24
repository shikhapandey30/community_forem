class ContestsController < ApplicationController
  before_action :set_contest, only: [:show, :edit, :update, :destroy, :leave]

  # GET /contests
  # GET /contests.json
  def index
    @contests = Contest.all.order("updated_at desc")
  end

  # GET /contests/1
  # GET /contests/1.json
  def show
    @comment = Comment.new
  end

  # GET /contests/new
  def new
    @contest = Contest.new
    @contest.build_upload
  end

  # GET /contests/1/edit
  def edit
    @contest.upload.present? ? @contest.upload : @contest.build_upload
  end

  # POST /contests
  # POST /contests.json
  def create
    @contest = current_user.contests.new(contest_params)

    respond_to do |format|
      if @contest.save
        format.html { redirect_to @contest, notice: 'Contest is successfully created.' }
        format.json { render :show, status: :created, location: @contest }
      else
        format.html { render :new }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contests/1
  # PATCH/PUT /contests/1.json
  def update
    respond_to do |format|
      if @contest.update(contest_params)
        set_upload
        format.html { redirect_to @contest, notice: 'Contest is successfully updated.' }
        format.json { render :show, status: :ok, location: @contest }
      else
        format.html { render :edit }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contests/1
  # DELETE /contests/1.json
  def destroy
    @contest.destroy
    respond_to do |format|
      format.html { redirect_to contests_url, notice: 'Contest is successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def leave  
    members = @contest.members.where(:user_id=> current_user.id)
    members.delete_all
    flash[:notice] = 'Group is successfully Leaved.'
    redirect_to '/dashboard'
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contest
      @contest = Contest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contest_params
      params.require(:contest).permit!
    end

    def set_upload
      @contest.upload.update_column(:image, nil) if params[:image_url].eql?("true")
      @contest.upload.update_column(:file, nil) if params[:file_url].eql?("true")
    end
end
