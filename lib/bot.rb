# frozen_string_literal: true

require_relative '../config/environment'
require_relative 'youtube'
require_relative 'spotify'

# comment
class MyBot < SlackRubyBot::Bot
  def self.slack_bck(type, text, emoji = nil)
    the_block = { "type": type, "text": text }
    the_block['enoji': emoji] unless emoji.nil?
    the_block
  end

  match(/^youtube\b.*$/i) do |client, data, _match|
    client.say(
      channel: data.channel,
      text: Youtube.youtube(data.text.gsub('youtube ', ''))
    )
  end

  match(/^spotify\b.*$/i) do |client, data, _match|
    client.say(
      channel: data.channel,
      text: Spotify.search(data.text.gsub('spotify ', ''))
    )
  end
end
