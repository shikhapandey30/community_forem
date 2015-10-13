OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
if Rails.env=='development'
   provider :twitter, 'C23spfl12cJbYe50wZnbB4yE0', '3sgkqf4PwjoAOzJuUd7WaNoTFzYQndYaEpfHnW3ZBerPmRuQ02'
   provider :facebook, '878522108867669', '6609eb34ca13c5728192b3c9ecdaed59'
   provider :google_oauth2, '916993778195-g8us044cdqf041giiu4nj3jnmthcd2is.apps.googleusercontent.com', 'fZtHAyE-zj51Qg5SE6Y-RVIW' 
else
	provider :facebook, '905207316223625', 'f61eda3cc0a382d542bfc0bc3ce9eeef'
    provider :google_oauth2,' 1073020948172-36om8fdogfq73knlp9a7lqb0vsg304q1.apps.googleusercontent.com','TIjBo9zIbqa1vVvNo3ZpTRgS' 
    provider :twitter, 'sCximTbSsmWPEZtl2qhlGaLZN', 'p4pgwnn5H5tlPJBGFjmFRZRY6b0IewOdNGutJBYYKGRoa7clFi'
end
end

