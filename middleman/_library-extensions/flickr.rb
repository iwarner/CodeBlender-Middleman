require "active_support/cache"
require "active_support/core_ext/integer/time"

module Flickr
  class Photo
    def initialize(id)
      @id = id
    end

    def title
      item['title']
    end

    def url
      "http://www.flickr.com/photos/#{item['owner']['username']}/#{item['id']}/"
    end

    def thumbnail_url
      "http://farm#{item['farm']}.staticflickr.com/#{item['server']}/#{item['id']}_#{item['originalsecret']}_o.#{item['originalformat']}"
    end

    def has_empty_title?
      title =~ /DSC_\d+/
    end

    def date_taken
      @date_taken ||= item['dates']['taken'].to_datetime
    end

    def <=>(photo)
      date_taken <=> photo.date_taken
    end

    private

    def item
      @item ||= cache.fetch(@id) do
        flickr.photos.getInfo(photo_id: @id)
      end
    end

    def cache
      @cache ||= ActiveSupport::Cache.lookup_store(:file_store, "/tmp/cache", expires_in: 1.year)
    end
  end

  class Fetcher
    cattr_accessor :api_key
    self.api_key = ENV['FLICKR_API_KEY']

    cattr_accessor :secret
    self.secret = ENV['FLICKR_SECRET']

    def initialize
      FlickRaw.api_key = api_key
      FlickRaw.shared_secret = secret
    end

    def by_photo_ids(photo_ids)
      [].tap do |result|
        photo_ids.each do |id|
          result << Photo.new(id)
        end
      end
    end

    def by_set_id(set_id)
      [].tap do |result|
        flickr.photosets.getPhotos(photoset_id: set_id)["photo"].each do |photo|
          result << Photo.new(photo["id"])
        end
      end.delete_if {|photo| photo.has_empty_title? }.sort
    end
  end

  class Renderer
    def initialize(photos)
      @photos = photos
    end

    def render
%Q{
<ul class="gallery">
  #{@photos.map { |photo| thumbnail(photo)}.join }
</ul>
}
    end

    private

    def thumbnail(photo)
%Q{
<li>
  #{photo.title unless photo.has_empty_title?}<br>
  <a href="#{photo.url}" target="_blank">
    <img src="#{photo.thumbnail_url}">
  </a>
</li>
}
    end
  end
end