# frozen_string_literal: true

require 'json'
require_relative 'http_request'
require 'dotenv'
Dotenv.load '../.env'
class Youtube
  # recieves a string and
  def self.search(search = 'beautifully')
    query = search.split(' ').join('%20')

    complete_uri = 'https://www.googleapis.com/youtube/v3/' \
    "search?part=snippet&q=#{query}&key=#{ENV['YOUTUBE_API']}"

    response = MyHttp.get(complete_uri)

    search_results = JSON.parse(response.body)['items']

    if search_results.length.zero?
      return "sorry I didn't find anything, can you be more specific :D?"
    end

    video_id = search_results[0]['id']['videoId']

    "https://youtu.be/#{video_id}"
  end
end
