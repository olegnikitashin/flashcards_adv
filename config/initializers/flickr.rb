Flickr.configure do |config|
  config.api_key       = ENV['FLICKR_API_KEY']
  config.shared_secret = ENV['SHARED_SECRET']
end
