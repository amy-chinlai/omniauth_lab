Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
    :authorize_params => { :display => 'popup' }
  puts "initialized!"
end



OmniAuth.config.allowed_request_methods = [:get, :post]