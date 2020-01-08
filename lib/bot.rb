# frozen_string_literal: true

require_relative '../config/environment'
require_relative 'youtube'
require_relative 'spotify'
require 'dotenv'
Dotenv.load '../.env'

# comment
class MyBot < SlackRubyBot::Bot
  help do
    title 'Music Buddy'
    desc 'Your friendly neighbor, who knows a little bit too much about music'

    command 'spotify' do
      desc('Usage: `spotify` + `your search`' \
        'Posts the best result for `your search` on spotify')
      long_desc('Usage: `spotify` + `your search`' \
        'Posts the best result for `your search` on spotify')
    end

    command 'youtube' do
      desc('Usage: `youtube` + `your search`' \
        'Posts the best result for `your search` on youtube')
      long_desc('Usage: `youtube` + `your search`' \
        'Posts the best result for `your search` on youtube')
    end
  end
  match(/^youtube\b.*$/i) do |client, data, _match|
    client.say(
      channel: data.channel,
      text: Youtube.search(data.text.gsub('youtube ', ''))
    )
  end

  match(/^spotify\b.*$/i) do |client, data, _match|
    client.say(
      channel: data.channel,
      text: Spotify.search(data.text.gsub('spotify ', ''))
    )
  end
end
