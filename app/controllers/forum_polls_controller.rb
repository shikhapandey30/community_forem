class ForumPollsController < ApplicationController

  #filters
  before_action :set_forum_poll, only: [:show, :edit, :update, :destroy]
  
  # fetching forum poll by search OR all forum poll
  def index
    # start change code- kandarp
    if params[:data].present?
      @forum_polls = ForumPoll.search(params[:data]).order("updated_at desc")
    else
      @forum_polls = ForumPoll.all.order("updated_at desc")
    end
    # end change code- kandarp
    # @forum_polls = ForumPoll.all.order("updated_at desc")
  end

  # fetching forum poll users
  def show    
    @users = @forum_poll.votes.collect(&:user).uniq.sort_by {|u| u.updated_at}.reverse
  	# votes=@forum_poll.votes
  	# user_vote=votes.where(:user_id=>current_user.id,:votable_id=>@forum_poll.id).first if current_user
  	#  if user_vote
   #     @user_vote_type=user_vote.vote_type
  	#  end
  end

  # initializing forum poll
  def new
    @forum_poll= ForumPoll.new
    @forum_poll.build_upload
  end

  # creating forum poll
  def create
    @forum_poll = current_user.forum_polls.new(forum_poll_params)
    respond_to do |format|
      if @forum_poll.save
        format.html { redirect_to @forum_poll, notice: 'Forum Poll is successfully created.' }
        format.json { render :show, status: :created, location: @forum_poll }
      else
        format.html { render :new }
        format.json { render json: @forum_poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # editing forum poll
  def edit
    authorize @forum_poll
    @forum_poll.upload.present? ? @forum_poll.upload : @forum_poll.build_upload
  end

  # updating forum poll
  def update
    authorize @forum_poll
    respond_to do |format|
      if @forum_poll.update(forum_poll_params)
        set_upload
        format.html { redirect_to dashboard_path, notice: 'Forum Poll is successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # delete forum poll
  def destroy
    authorize @forum_poll
    @forum_poll.destroy
    respond_to do |format|
      format.html { redirect_to forum_polls_url, notice: 'Forum Poll is successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    
    # setting forum poll for all action under this controller
    def set_forum_poll
      @forum_poll= ForumPoll.find(params[:id])
    end

    #permitting forum polls parameters
    def forum_poll_params
      params.require(:forum_poll).permit!
    end

    # Image updating or not
    def set_upload
      @forum_poll.upload.update_column(:image, nil) if params[:image_url].eql?("true")
      @forum_poll.upload.update_column(:file, nil) if params[:file_url].eql?("true")
    end
end