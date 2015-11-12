OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  #set your FACEBOOK_APP_ID and FACEBOOK_SECRET environment variables in your ~/.bash_profile
  #if authentication errors still persist, you can source the bash_profile. In the terminal, type:
  #  source ~/.bash_profile
  provider :facebook, ENV["FACEBOOK_APP_ID"], ENV["FACEBOOK_SECRET"]
end