# frozen_string_literal: true

require 'json'
require 'dotenv'
require_relative 'http_request'
Dotenv.load '../.env'

class Spotify
  def self.auth_token
    credentials = MyHttp.post_basic(
      'https://accounts.spotify.com/api/token',
      ENV['SPOTIFY_API']
    )

    credentials.body.split('"')[3]
  end

  def self.search(song_name = 'hello adele')
    query = song_name.split(' ').join('%20')

    token = Spotify.auth_token

    song_json = MyHttp.get_bearer(
      "https://api.spotify.com/v1/search?q=#{query}&type=track&limit=1",
      token
    )

    search_results = JSON.parse(song_json.body)['tracks']['items']

    if search_results.length.zero?
      return "I couldn't find anything with those parameters D:"
    end

    search_results[0]['external_urls']['spotify']
  end
end
