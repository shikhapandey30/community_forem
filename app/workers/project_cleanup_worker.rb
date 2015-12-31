# app/workers/project_cleanup_worker.rb
class ProjectCleanupWorker
  include Sidekiq::Worker

  def perform(object_id, object_type, image_path, video_url, file_path, site_link)
  	u = Upload.find_or_initialize_by(:uploadable_id => object_id, :uploadable_type => object_type ) 
  	if image_path.present? 
  	  u.remote_image_url = image_path 
    end

    if file_path.present?
	  u.remote_file_url = file_path 
	end
  	u.video = video_url
  	u.site_link = site_link
  	u.save
  	if image_path.present? 
  	  u.remote_image_url = image_path 
    end

    if file_path.present?
	  u.remote_file_url = file_path 
	end
	u.save
    # do lots of project cleanup stuff here
  end
end
# ProjectCleanupWorker.new.perform(@project.id)  ## NOT BACKGROUND
# ProjectCleanupWorker.perform_async(@project.id)


# # ProjectCleanupWorker.new.perform(@project.id)  ## NOT BACKGROUND

# ProjectCleanupWorker.perform_in(10.minutes, @project.id)
# # OR
# ProjectCleanupWorker.perform_at(2.days.from_now, @project.id)

