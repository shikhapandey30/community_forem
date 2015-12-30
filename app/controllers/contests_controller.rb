class ContestsController < ApplicationController
  before_action :set_contest, only: [:show, :edit, :update, :destroy, :leave]

  # GET /contests
  # GET /contests.json
  def index
    # start change code- kandarp
    if params[:data].present?
      @contests = Contest.search(params[:data]).order("updated_at desc")
    else
      @contests = Contest.all.order("updated_at desc")
    end
    # end change code- kandarp
    # @contests = Contest.all.order("updated_at desc")
  end

  # GET /contests/1
  # GET /contests/1.json
  def show
    # @comment = Comment.new
    @users = @contest.votes.collect(&:user).uniq.sort_by {|u| u.updated_at}.reverse
  end

  # GET /contests/new
  def new
    @contest = Contest.new
    @contest.build_upload
  end

  # GET /contests/1/edit
  def edit
    authorize @contest
    @contest.upload.present? ? @contest.upload : @contest.build_upload
  end

  # POST /contests
  # POST /contests.json
  def create
    @contest = current_user.contests.new(contest_params)

    respond_to do |format|
      if @contest.save
        set_upload
        set_members if params[:contest][:members].present? 
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
    authorize @contest
    respond_to do |format|
      if @contest.update(contest_params)
        set_upload
        set_members if params[:contest][:members].present?         
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
    authorize @contest
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
      # params.require(:contest).permit!
       params.require(:contest).permit(:category_id, :topic, :headline, :slogan, :community_logo, :start_date, :end_date, :description, upload_attributes: [:id, :image, :site_link, :file, :video, :_destroy])

    end

    def set_upload
      @contest.upload.update_column(:image, nil) if params[:image_url].eql?("true")
      @contest.upload.update_column(:file, nil) if params[:file_url].eql?("true")
    end

     def set_members
      members_ids = params[:contest][:members].reject(&:empty?)
       @contest.members.destroy_all if params[:action] == "update"
      members_ids.each do |members_id|
        member = Member.create(:user_id => members_id.to_i, :invitable => @contest)
        #send notification
        reciver =  User.find(members_id)
        if reciver.notification_setting.try(:new_update)
          Notification.create(recepient_id: members_id, user: current_user, body: "#{current_user.screen_name } has invited you to join a contest #{@contest.topic} ", notificable: @contest, :accept => false)
        end
      end
    end
end
