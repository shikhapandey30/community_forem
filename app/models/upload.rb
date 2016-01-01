class Upload < ActiveRecord::Base

    ## Model Associations
	belongs_to :uploadable, polymorphic: true
    
	mount_uploader :file, UploadUploader
    mount_uploader :image, UploadUploader
    # mount_uploader :file, GroupUploader
    # mount_uploader :image, GroupUploader
    # mount_uploader :file, ForumPollUploader
    # mount_uploader :image, ForumPollUploader
    # mount_uploader :file, ContestUploader
    # mount_uploader :image, ContestUploader
    # mount_uploader :file, MeetingRoomUploader
    # mount_uploader :image, MeetingRoomUploader
end