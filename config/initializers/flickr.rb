require "active_support/cache"
require "active_support/core_ext/numeric/time"

Flickr.configure do |config|
  config.api_key       = ENV['FLICKR_API_KEY']
  config.shared_secret = ENV['SHARED_SECRET']

  config.cache = ActiveSupport::Cache::MemoryStore.new(expires_in: 6.hours)
end
