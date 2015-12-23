class TopicsController < ApplicationController
 before_action :set_topic, only: [:show, :edit, :update, :destroy]
  def create
    if params[:topic][:forum_id].present? 
  	 @forum = Forum.find(params[:topic][:forum_id])
       @topic = @forum.topics.create(topic_params)
      else
        @topic=Topic.new(topic_params)
      end
    if @topic.save
      attachment=@topic.attachments.create(:file=>params[:topic][:file])
      redirect_to dashboard_path, notice: 'topic is successfully created.' 
    else
       render 'new'
    end
  end
   def update
    respond_to do |format|
      if @topic.update(topic_params)
        format.html { redirect_to @topic, notice: 'topic is successfully updated.' }
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
      format.html { redirect_to :back, notice: 'topic is successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
           @topic= Topic.friendly.find(params[:id])
    end


    def topic_params
      params.require(:topic).permit(:forum_id, :user_id, :description, :name,:file,:topic_id)
    end
end

