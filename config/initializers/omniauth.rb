Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer unless Rails.env.production?
    # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
    provider :github, ENV['932d0d34617a6b004987'], ENV['1f20cd9c74b6c5712ae6e9fc917df005c4c60137']
  end