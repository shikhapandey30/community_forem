class PostsController < ApplicationController

  ## Filters
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    posts = Post.all
    pub_post=posts.where("visibility =? AND user_id != ?", 'Public', current_user.id)
    self_post=current_user.posts
    @posts=pub_post+self_post
  end

  ## Showing post
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

  ## Initializing Post
  def new
    @post = Post.new
    @post.build_upload
  end

  ## Editing Post
  def edit
    authorize @post
    @post.upload.present? ? @post.upload : @post.build_upload
  end

  ## Creation of Post
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
          # ProjectCleanupWorker.perform_async(@post.id, @post.class.name, params[:post][:upload_attributes][:image].try(:path) ,params[:post][:upload_attributes][:video], params[:post][:upload_attributes][:file].try(:path), params[:post][:upload_attributes][:site_link])

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

  ## Updating Post
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

  ## Deleting Post
  def destroy
    authorize @post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: 'Post is successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    ## Setting Post
    def set_post       
     @post=Post.friendly.find(params[:id])     
    end

    ## Allowing post parameters
    def post_params
      # params.require(:post).permit(:user_id, :category_id, :title, :description, :visibility, :expiration_date, :topic, :start_date, :headline)
      params.require(:post).permit(:user_id, :category_id, :title, :description, :visibility, :expiration_date, :topic, :start_date, :headline ,upload_attributes: [:id, :image, :site_link, :file, :video, :_destroy])
      
    end

    ## Updating image, file
    def set_upload
      @post.upload.update_column(:image, nil) if params[:image_url].eql?("true")
      @post.upload.update_column(:file, nil) if params[:file_url].eql?("true")
      # @post.upload.destroy
      # @post.build_upload(image: params[:image], file: params[:file] , site_link: params[:site_link] , video: params[:video] )
      # @post.save
    end
end