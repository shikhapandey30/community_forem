class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :edit, :update, :destroy]

  # GET /communities
  # GET /communities.json
  def index
    @communities = current_user.communities
    @friends = current_user.my_friends
    @friends = @friends.present? ? @friends : []
    # @suggested_communities = 
  end

  # GET /communities/1
  # GET /communities/1.json
  def show
  end

  # GET /communities/new
  def new
    @community = Community.new
    @community.build_upload
    @friends = current_user.my_friends
    @friends = @friends.present? ? @friends : []
  end

  # GET /communities/1/edit
  def edit
    @community.upload.present? ? @community.upload : @community.build_upload
  end

  # POST /communities
  # POST /communities.json
  def create
    @community = current_user.communities.new(community_params)
    respond_to do |format|
      if @community.save
        if params[:community][:members].present?
          members_ids = params[:community][:members].reject(&:empty?)
          members_ids.each do |members_id|
            member = Member.create(:user_id => members_id.to_i, :invitable => @community)

            #send notification
            Notification.create(recepient_id: members_id, user: current_user, body: "#{current_user.screen_name } has invited you to join a community #{@community.headline} ", notificable: @community, :accept => false)

          end
        end
        format.html { redirect_to @community, notice: 'Community was successfully created.' }
        format.json { render :show, status: :created, location: @community }
      else
        format.html { render :new }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /communities/1
  # PATCH/PUT /communities/1.json
  def update
    respond_to do |format|
      set_upload(params[:community][:upload_attributes])
      if @community.update(community_params)
        if params[:community][:members].present?
          members_ids = params[:community][:members].reject(&:empty?)
          members_ids.each do |members_id|
            member = Member.find_or_initialize_by(:user_id => members_id.to_i, :invitable => @community)
            member.save
            #send notification
           notification = Notification.find_or_initialize_by(recepient_id: @friendship.members_id, user: current_user, body: "#{current_user.screen_name } has has invited you to join a community #{@community.headline} ", notificable: @friendship, :accept => false)
           notification.save
          end
        end
        format.html { redirect_to @community, notice: 'Community was successfully updated.' }
        format.json { render :show, status: :ok, location: @community }
      else
        format.html { render :edit }
        format.json { render json: @community.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /communities/1
  # DELETE /communities/1.json
  def destroy
    @community.destroy
    respond_to do |format|
      format.html { redirect_to communities_url, notice: 'Community was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community
      @community = Community.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def community_params
      params.require(:community).permit(:category_id, :topic, :headline, :slogan, :community_logo, :description, upload_attributes: [:id, :image, :_destroy])
    end

    def set_upload params
      @community.upload.destroy
      @community.build_upload( image: params[:image] )
      @community.save
    end
end
