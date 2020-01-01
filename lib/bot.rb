# frozen_string_literal: true

require_relative '../config/environment'

# comment
class MyBot < SlackRubyBot::Bot
  command(/.*\bhello\b.*$/i) do |client, data, _match|
    client.say(channel: data.channel, text: 'hi')
  end

  command(/.*\bquote\b.*$/i) do |client, data, _match|
    # logger.info "#{client.owner}, user=#{data.user} - market sucks!"

    # DIA (Dow Jones Industrial Average ETF) closely but not quite imiates the DOW

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
            {
              "type": 'mrkdwn',
              "text": "*Type:*\nComputer (laptop)"
            },
            {
              "type": 'mrkdwn',
              "text": "*When:*\nSubmitted Aut 10"
            },
            {
              "type": 'mrkdwn',
              "text": "*Last Update:*\nMar 10, 2015 (3 years, 5 months)"
            },
            {
              "type": 'mrkdwn',
              "text": "*Reason:*\nAll vowel keys aren't working."
            },
            {
              "type": 'mrkdwn',
              "text": "*Specs:*\n\"Cheetah Pro 15\" - Fast, really fast\""
            }
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
