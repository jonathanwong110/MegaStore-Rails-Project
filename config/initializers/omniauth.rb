Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, ENV['GITHUB_ID'], ENV['GITHUB_KEY']
end