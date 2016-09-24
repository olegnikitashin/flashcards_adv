class FlickrPhotos
  class << self
    def flickr(tag)
      photos = Flickr.photos.search(tags: tag, per_page: 10)
      photos.collect do |photo|
        URI.join "https://farm#{photo.farm}.staticflickr.com/", "#{photo.server}/", "#{photo.id}_#{photo.secret}.jpg/"
      end
    end
  end
end
