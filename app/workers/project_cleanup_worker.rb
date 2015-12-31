# app/workers/project_cleanup_worker.rb
class ProjectCleanupWorker
  include Sidekiq::Worker

  def perform(project_id)
  	debugger
    # do lots of project cleanup stuff here
  end
end

# ProjectCleanupWorker.new.perform(@project.id)  ## NOT BACKGROUND
# ProjectCleanupWorker.perform_async(@project.id)


# # ProjectCleanupWorker.new.perform(@project.id)  ## NOT BACKGROUND

# ProjectCleanupWorker.perform_in(10.minutes, @project.id)
# # OR
# ProjectCleanupWorker.perform_at(2.days.from_now, @project.id)

