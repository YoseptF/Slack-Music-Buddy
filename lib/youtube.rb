# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

class Youtube
  # recieves a string and
  def self.youtube(search = 'beautifully')
    query = search.split(' ').join('%20')
    r = "q=#{query}&key=#{ENV['YOUTUBE_API']}"
    complete = 'https://www.googleapis.com/youtube/v3/search?part=snippet&' + r
    uri = URI.parse(complete)
    request = Net::HTTP::Get.new(uri)
    request['Accept'] = 'application/json'

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    video_id = JSON.parse(response.body)['items'][0]['id']['videoId']

    if video_id.nil?
      return "sorry I didn't find anything, can you be more specific :D?"
    end

    "https://youtu.be/#{video_id}"
  end
end
