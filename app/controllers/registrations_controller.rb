class RegistrationsController < Devise::RegistrationsController
	# def update
	# 	super
	# end
 protected

  def after_sign_up_path_for(resource)
   '/profiles/new'# Or :prefix_to_your_route
  end
   # private 

   #  # Never trust parameters from the scary internet, only allow the white list through.
   #  def user_params
   #     params.require(:user).permit(:first_name, :last_name, :screen_name, :email, :password, :password_confirmation, :current_password, notification_setting_attribute: [:id, :user_id, :new_update, :friend_request, :is_new_record, :comments_and_like ,:friends_birthday, :_destroy])
   #  end

end
