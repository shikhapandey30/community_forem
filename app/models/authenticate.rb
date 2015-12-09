class Authenticate < ActiveRecord::Base
	belongs_to :user
	def self.from_omniauth(auth)
  authenticate = where(provider: auth['provider'], :uid=>auth['uid']).first_or_initialize
    if authenticate.user
      authenticate.provider = auth.provider
      authenticate.uid = auth.uid
      else
          user = User.new
        authenticate.provider = auth.provider
        authenticate.uid = auth.uid
        user.email = auth.info.email
        if user.email.blank?
          user.email=auth.extra.raw_info.id.to_s+"@gmail.com"
        end
        email=User.find_by_email( user.email )
        user.confirmed_at = Time.now
        user.password =  Devise.friendly_token.first(8)
        user.save!(:validate => false)
        authenticate.user_id = user.id
     end
      authenticate.save
      authenticate.user
  end
end
