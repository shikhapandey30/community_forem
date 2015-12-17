class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # GET /friendships
  # GET /friendships.json
  def index
    # @friendships = current_user.friendships +  current_user.inverse_friendships
    # # @friends =  current_user.friends +  current_user.inverse_friends
    # @friends = User.where(:id => current_user.friendships.collect(&:friend_id))
    # @inverse_friends = User.where(:id => current_user.inverse_friendships.collect(&:user_id))
    # @friends = (@friends + @inverse_friends)
    # @friends =@friends.paginate(:page => params[:page], :per_page => 10)
     @friends = current_user.friends + current_user.inverse_friends
     @friends.delete(current_user)
  end
  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships
  # POST /friendships.json
  def create
    #user = User.find(params[:friend_id])
    #User.invite!(:email => user.email, :first_name => user.first_name)
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
      
    respond_to do |format|
      if @friendship.save
           Notification.create(recepient: @friendship.friend, user: current_user, body: "#{current_user.screen_name } has request to connect ", notificable: @friendship, :accept => false)

        format.html { redirect_to '/', notice: 'Invitation has been sent successfully' }
        # format.json { render :show, status: :created, location: @friendship }
        format.js
      else
        format.html { render :new }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    respond_to do |format|
      if @friendship.update_attributes(:accept => params[:accept])
        format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to friendships_url, notice: 'Friendship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def unfriend
     @friendship = Friendship.where(:user_id => current_user.id, :friend_id => params[:friend_id])
     @friendship = Friendship.where(:friend_id => current_user.id, :user_id => params[:friend_id]) if @friendship.blank?
     @friendship.destroy_all
  end

  def followings
    @users = User.all.paginate(:page => params[:page], :per_page => 10)
  end

  def follow
    @following = Following.where(:following_id => current_user.id, :follower_id => params[:follower_id]).first

    if @following.nil?
     @following = Following.create(:following_id => current_user.id, :follower_id => params[:follower_id])
    else
      @unfollow = @following.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :approved, :create, :destroy)
    end
end
