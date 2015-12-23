class ForumPollsController < ApplicationController
  before_action :set_forum_poll, only: [:show, :edit, :update, :destroy]
  
  def index
    @forum_polls = ForumPoll.all.order("updated_at desc")
  end
  
 

  def show
  	votes=@forum_poll.votes
  	user_vote=votes.where(:user_id=>current_user.id,:votable_id=>@forum_poll.id).first if current_user
  	 if user_vote
       @user_vote_type=user_vote.vote_type
  	 end
  end

  def new
    @forum_poll= ForumPoll.new
    @forum_poll.build_upload
  end

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

  def edit
    @forum_poll.upload.present? ? @forum_poll.upload : @forum_poll.build_upload
  end

  def update
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

  # DELETE /contests/1
  # DELETE /contests/1.json
  def destroy
    @forum_poll.destroy
    respond_to do |format|
      format.html { redirect_to forum_polls_url, notice: 'Forum Poll is successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    def set_forum_poll
      @forum_poll= ForumPoll.find(params[:id])
    end
    def forum_poll_params
      params.require(:forum_poll).permit!
    end

    def set_upload
      @forum_poll.upload.update_column(:image, nil) if params[:image_url].eql?("true")
      @forum_poll.upload.update_column(:file, nil) if params[:file_url].eql?("true")
    end
end