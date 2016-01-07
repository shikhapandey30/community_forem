class FriendshipsController < ApplicationController

  # filters
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # GET /friendships
  # GET /friendships.json

  # fetching all friends to whom the user sent request and from whom the user got friendship request OR searching user friend connection by screen name
  def index
    # @friendships = current_user.friendships +  current_user.inverse_friendships
    # # @friends =  current_user.friends +  current_user.inverse_friends
    # @friends = User.where(:id => current_user.friendships.collect(&:friend_id))
    # @inverse_friends = User.where(:id => current_user.inverse_friendships.collect(&:user_id))
    # @friends = (@friends + @inverse_friends)
    # @friends =@friends.paginate(:page => params[:page], :per_page => 10)
    
    if params[:name].present?
      @friends = (current_user.friends.search(params[:name]) + current_user.inverse_friends.search(params[:name])).compact.uniq.sort_by(&:updated_at).reverse
      @friends.uniq.delete(current_user)
    else
      @friends = current_user.friends + current_user.inverse_friends
      @friends.delete(current_user)
      @friends = @friends.uniq.paginate(:page => params[:page], :per_page => 10)
    end
  end
  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # initializing friendship
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # creating friendship request and sending notification to connect to user
  def create
    #user = User.find(params[:friend_id])
    #User.invite!(:email => user.email, :first_name => user.first_name)
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
      
    respond_to do |format|
      if @friendship.save
        Notification.create(recepient: @friendship.friend, user: current_user, body: "#{current_user.screen_name } has request to connect ", notificable: @friendship, :accept => false)
        # NotificationMailer.friend_request(@friendship).deliver_later
        
        @suggested_connections, @suggest = suggested_connections
        format.html { redirect_to '/', notice: 'Invitation has been sent successfully' }
        # format.json { render :show, status: :created, location: @friendship }
        format.js
      else
        format.html { render :new }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end    
  end

  # accepting the friendship request
  def update
    respond_to do |format|
      if @friendship.update_attributes(:accept => params[:accept])
        format.html { redirect_to @friendship, notice: 'Friendship is successfully updated.' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # delete friendship
  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to friendships_url, notice: 'Friendship is successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Unfriend the friendship
  def unfriend
     @friendship = Friendship.where(:user_id => current_user.id, :friend_id => params[:friend_id])
     @friendship = Friendship.where(:friend_id => current_user.id, :user_id => params[:friend_id]) if @friendship.blank?
     @friendship.destroy_all
  end

  def followings
    @users = User.all.paginate(:page => params[:page], :per_page => 10)
  end

  # following nad unfollowing
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

    # suggested connections
    def suggested_connections
      if request.headers["HTTP_REFERER"].include?("suggested_connections")
        @suggested_connections = new_suggested_connections
        @suggest =  false
      else
        @suggested_connections = new_suggested_connections.first(2)
        @suggest =  true
      end
      return @suggested_connections, @suggest
    end
end
