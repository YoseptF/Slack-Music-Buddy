# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'
require 'dotenv'
Dotenv.load '../.env'

class Spotify
  def self.search(song_name = 'hello adele')
    query = song_name.split(' ').join('%20')
    c_uri = URI.parse('https://accounts.spotify.com/api/token')

    request = Net::HTTP::Post.new(c_uri)
    request['Authorization'] = "Basic #{ENV['SPOTIFY_API']}"
    request.set_form_data(
      'grant_type' => 'client_credentials'
    )

    req_options = {
      use_ssl: c_uri.scheme == 'https'
    }

    credentials = Net::HTTP.start(
      c_uri.hostname,
      c_uri.port,
      req_options
    ) do |http|
      http.request(request)
    end

    token = credentials.body.split('"')[3]

    s_uri = URI.parse(
      "https://api.spotify.com/v1/search?q=#{query}&type=track&limit=1"
    )
    request = Net::HTTP::Get.new(s_uri)
    request['Authorization'] = "Bearer #{token}"

    req_options = {
      use_ssl: s_uri.scheme == 'https'
    }

    song_json = Net::HTTP.start(
      s_uri.hostname,
      s_uri.port,
      req_options
    ) do |http|
      http.request(request)
    end

    if JSON.parse(song_json.body)['tracks']['items'].length.zero?
      return "I couldn't find anything with those parameters D:"
    end

    JSON.parse(song_json.body)['tracks']['items'][0]['external_urls']['spotify']
  end
end
