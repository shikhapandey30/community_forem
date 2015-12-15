class Upload < ActiveRecord::Base
	belongs_to :uploadable, polymorphic: true
	mount_uploader :file, PostUploader
    mount_uploader :image, PostUploader
    mount_uploader :video, PostUploader
end
