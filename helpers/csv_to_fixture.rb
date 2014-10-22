#!/usr/bin/env ruby

# Usage: ruby csv_to_fixture.rb data/_data.csv
#
# "id","name","mime_type","extensions","icon_url"
# "1","unknown","unknown/unknown","||","/images/icon/file_unknown.gif"
# "2","image/tiff","image/tiff","|tiff|tif|","/images/icon/blank.png"
#
# if you want to remove the id: "number" line from the resulting YAML file
# do a find and replace for: ^( id: \"\d*\"\n) in Textmate

# require 'csv'
# require 'yaml'

# input   = ARGV.shift
# is_file = (input.nil? ? false : File.exist?(input))

# file    = is_file ? input : STDIN

# doc     = is_file ? CSV.read(file) : CSV.parse(file.read)
# fields  = doc.shift
# records = Hash.new

# doc.each_with_index do |row, i|

#     record = Hash.new

#     # puts row[1]

#     fields.each_with_index do |field, j|

#         record["category"]       = row[1].to_s.downcase.gsub(/[^a-z ]/, '').gsub(/ /, '')
#         record["address"]        = row[2].to_s.strip
#         record["description"]    = row[4].to_s.strip
#         record["email"]          = row[5].to_s.strip
#         record["excerpt"]        = row[3].to_s.strip
#         record["name"]           = row[1].to_s.strip

#         if row[6]
#             record["phone"] = "+" + row[6].to_s.strip
#         end

#         record["urlFacebook"]    = row[10].to_s.strip
#         record["urlFoursquare"]  = row[11].to_s.strip
#         record["urlTripAdvisor"] = row[9].to_s.strip
#         record["urlTwitter"]     = row[12].to_s.strip
#         record["urlMap"]         = row[8].to_s.strip
#         record["urlWebsite"]     = row[7].to_s.strip

#     end

#     records["#{i}"] = record

# end

# # Create a new file and write to it
# File.open('data/ubud_listings.yaml', 'w') do |f2|

#   f2.puts records.to_yaml

# end