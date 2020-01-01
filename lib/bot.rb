# frozen_string_literal: true

require_relative '../config/environment'
require 'dotenv/load'

# comment
class MyBot < SlackRubyBot::Bot
  def self.block_skelly(type, text, emoji = nil)
    the_block = { "type": type, "text": text }
    the_block['enoji': emoji] unless emoji.nil?
    the_block
  end

  command(/.*\bhello\b.*$/i) do |client, data, _match|
    client.say(channel: data.channel, text: 'hi')
  end

  command(/.*\bquote\b.*$/i) do |client, data, _match|
    client.web_client.chat_postMessage(
      channel: data.channel,
      as_user: true,
      blocks: [
        {
          "type": 'section',
          "text": {
            "type": 'mrkdwn',
            "text": "You have a new request:\n*<fakeLink.toEmployeeProfile.com|Fred Enriquez - New device request>*"
          }
        },
        {
          "type": 'section',
          "fields": [
            MyBot.block_skelly('mrkdwn', "*Type:*\nComputer (laptop)"),
            MyBot.block_skelly('mrkdwn', "*When:*\nSubmitted Aut 10"),
            MyBot.block_skelly('mrkdwn', "*Last Update:*\nMar 10, 2015 (3)"),
            MyBot.block_skelly('mrkdwn', "*Reason:*\nvowel keys arent working"),
            MyBot.block_skelly('mrkdwn', "*Specs:*\n\"Cheetah Pro 15\"\"")
          ]
        },
        {
          "type": 'actions',
          "elements": [
            {
              "type": 'button',
              "text": {
                "type": 'plain_text',
                "emoji": true,
                "text": 'Approve'
              },
              "style": 'primary',
              "value": 'click_me_123'
            },
            {
              "type": 'button',
              "text": {
                "type": 'plain_text',
                "emoji": true,
                "text": 'Deny'
              },
              "style": 'danger',
              "value": 'click_me_123'
            }
          ]
        }
      ]
    )
  end
end
