OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do 
  provider :google_oauth2, AppConfig[:oauth_google_client_id], AppConfig[:oauth_google_client_secret],
    {
     :prompt => "select_account"
    }  
  provider :identity, on_failed_registration: ->(env) { IdentitiesController.action(:new).call(env) }
end
