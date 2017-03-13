##
# Image
#
# @usage
# ruby -r "./image.rb" -e "Image.new.process"
#
# @author   Ian Warner <ian.warner@drykiss.com>
# @category extension
#
# @see      https://github.com/toy/image_optim
# @see      https://github.com/sdsykes/fastimage
##

# require "mini_magick"
# require "image_optim"

# Require
require "open-uri"
require "RMagick"
include Magick

require 'carrierwave'
require 'carrierwave/processing/rmagick'
require "carrierwave-imageoptim"

##
# Carrier wave optimisation
##
class ProcessImage < CarrierWave::Uploader::Base

    # Include
    include CarrierWave::RMagick
    # include CarrierWave::Processing::RMagick
    include CarrierWave::ImageOptim

    storage :file

    # before :store, :remember_cache_id
    # after  :store, :delete_tmp_dir
    after :store, :delete_old_tmp_file

    # Save directory
    def store_dir
        "../cache/images"
    end

    # remember the tmp file
    def cache!( new_file )
        super
        @old_tmp_file = new_file
    end

    def delete_old_tmp_file( dummy )
        @old_tmp_file.try :delete
    end

    # Convert
    # process convert: 'jpg'

    def full_filename( for_file )
        super.downcase
        # super.chomp( File.extname( super ) ) + '.jpg'
    end

    # Resize
    process resize_to_fill: [ 750, 422 ]

    # Optimise
    # process :strip
    # process :colorspace => :rgb
    process optimize: [{
        jhead: true,
        jpegrecompress: true,
        jpegtran: true,
        jpegoptim: true,
        optipng:   true,
        gifsicle:  true
    }]

end

##
# Convenience wrapper for Instagram
##
class Image

    ##
    # Constructor. Loads all parameters from environment variables.
    ##
    def initialize

        # Debug
        # puts "Initialise"

    end

    ##
    # process
    ##
    def process( src="https://lh6.googleusercontent.com/9a7zX1H5yl5QfufPRo0sqOscWUEDrXSV7h0ansvpeFZQm0bcG0HtlMoGhlQpM4HVkh_ov4V_JfqkqagkfpsH6Hpi2F6ev-QtL55jBaP4Y9b0-lI9jISN-meCgFYJA-56cRa_w4zA" )

        # Fetch src
        image = resize( src )

    end

    ##
    # Optimise image
    ##
    def resize( src )

        uploader = ProcessImage.new
        uploader.download! src
        uploader.store!
        uploader.file.identifier

    end

    ##
    # Report
    ##
    def report
    end

end
