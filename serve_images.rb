#!/usr/bin/env ruby

require 'sinatra'
require 'base64'

DATA_DIR = ENV['DATA_DIR']

def create_data_uri(source_file, mime_type)
  file_contents = File.open(source_file) { |f| f.read }
  encoded_string = Base64.encode64(file_contents)
  "data:#{mime_type};base64,#{encoded_string}"
end

get '/' do
  to_return = ''
  Dir["#{DATA_DIR}/*.jpeg"].each do |path|
    puts "reading in file: #{path}"
    to_embed = create_data_uri(path, 'image/jpeg')
    to_return += "<img style='float: left;' src='#{to_embed}'/>"
  end
  to_return
end
