class TopicsController < InheritedResources::Base
 before_action :set_topic, only: [:show, :edit, :update, :destroy]
  def create
  	@forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.create(topic_params)
    respond_to do |format|
    if @topic.save
      format.html { redirect_to @topic, notice: 'topic was successfully created.' }
        # format.json { render :show, status: :created, location: @topic }
        format.js
    end
    end
  end
   def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'topic was successfully updated.' }
        format.js { render :update, status: :ok, location: @topic}
       # format.json { render :show, status: :ok, location: @topic }
      else
        format.html { render :edit }
       format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'topic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end


    def topic_params
      params.require(:topic).permit(:forum_id, :user_id, :description, :name)
    end
end

