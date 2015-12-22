OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
	if Rails.env=='development'
	   provider :twitter, 'C23spfl12cJbYe50wZnbB4yE0', '3sgkqf4PwjoAOzJuUd7WaNoTFzYQndYaEpfHnW3ZBerPmRuQ02'
	   provider :facebook, '878522108867669', '6609eb34ca13c5728192b3c9ecdaed59'
	   provider :google_oauth2, '396575505314-brabtbh9m5j30ed58r5a47fv6eg927lv.apps.googleusercontent.com', 'RM9P7ofSE7jCgbKmXXGe_O0Y' 
	else
		provider :facebook, '905207316223625', 'f61eda3cc0a382d542bfc0bc3ce9eeef'
		# provider :facebook, '799459666846212', '7ae79a258d97ca08683643fd3396db97'
	    provider :google_oauth2, '1093558848521-3m8i6fgl9uloku6ehvk3jg4fm6c3vve0.apps.googleusercontent.com','1hz66kkvYPrTTi2ZZeIzzbwg'
	    provider :twitter, 'LnBSs9jpmYPYwVpe2Hi5yut2y', 'EjMqpvnbfIs7mUH3C8G7MuOQpWM4Z5uojTTQWZ393eD57tYLqU'
	end
end

