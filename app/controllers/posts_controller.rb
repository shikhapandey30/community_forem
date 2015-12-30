class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]  
  def index
    posts = Post.all
    pub_post=posts.where("visibility =? AND user_id != ?", 'Public', current_user.id)
    self_post=current_user.posts
    @posts= (pub_pos + self_post).sort_by(&:updated_at)
  end

  # GET /Posts/1
  # GET /Posts/1.json
  def show
    @comment = Comment.new
    @comments = @post.comments
    @designation = @post.user.employment_details.collect(&:designation)
    if @designation.present?
      @designation = @designation.join(", ")
    else
      @designation = ""
    end
  end

  # GET /Posts/new
  def new
    @post = Post.new
    @post.build_upload
  end

  # GET /Posts/1/edit
  def edit
    authorize @post
    @post.upload.present? ? @post.upload : @post.build_upload
  end

  # POST /Posts
  # POST /Posts.json
  def create
      @post = current_user.posts.new(post_params)
    if params[:group_id].present?
      @object = Group.find(params[:group_id])
    elsif params[:community_id].present?
      @object = Community.find(params[:community_id])
    end
      @post.postable =  @object

    respond_to do |format|
      if @post.save
        if @post.postable.present?
          format.html { redirect_to :back, notice: 'Post is successfully created.' }          
        else
          format.html { redirect_to dashboard_path, notice: 'Post is successfully created.' }
        end
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Posts/1
  # PATCH/PUT /Posts/1.json
  def update
     authorize @post
    respond_to do |format|
      if @post.update(post_params)
        set_upload
        format.html { redirect_to dashboard_path, notice: 'Post is successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Posts/1
  # DELETE /Posts/1.json
  def destroy
    authorize @post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: 'Post is successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
      def set_post       
       @post=Post.find(params[:id])     
    end

    def post_params
      params.require(:post).permit!
      # (:user_id, :category_id, :title, :description, :visibility, :expiration_date, :created_at, :updated_at, :topic_id, :topic, :start_date)
    end

    def set_upload
      @post.upload.update_column(:image, nil) if params[:image_url].eql?("true")
      @post.upload.update_column(:file, nil) if params[:file_url].eql?("true")
      # @post.upload.destroy
      # @post.build_upload(image: params[:image], file: params[:file] , site_link: params[:site_link] , video: params[:video] )
      # @post.save
    end
end