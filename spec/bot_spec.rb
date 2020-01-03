# frozen_string_literal: true

require_relative('../lib/bot.rb')

describe MyBot do
  context 'listens for a message starting with *youtube*'\
  ' chops it and sends it to search' do
    it "returns the link of the video if there's one", :vcr do
      expect(message: 'youtube hello').to respond_with_slack_message('https://youtu.be/YQHsXMglC9A')
    end

    it 'returns an error message if the search fails', :vcr do
      fail_yt_message = 'youtube search engineasd vqwionbrd3498 23i '\
      'bn35rb13qt5 31285 t1432q'
      expect(
        message: fail_yt_message
      ).to respond_with_slack_message(
        "sorry I didn't find anything, can you be more specific :D?"
      )
    end
  end
  my_context = 'listens for a message starting '\
  'with *spotify* chops it and sends it to search'
  context my_context do
    it "returns the link of the song if there's one", :vcr do
      expect(message: 'spotify still dre').to respond_with_slack_message('https://open.spotify.com/track/503OTo2dSqe7qk76rgsbep')
    end

    it 'returns an error message if the search fails', :vcr do
      fail_sp_message = 'spotify search engineasd '\
      'vqwionbrd3498 23i bn35rb13qt5 31285 t1432q'
      expect(
        message: fail_sp_message
      ).to respond_with_slack_message(
        "I couldn't find anything with those parameters D:"
      )
    end
  end
  it 'says hi', :vcr do
    expect(
      message: "#{SlackRubyBot.config.user} hi"
    ).to respond_with_slack_message('Hi <@user>!')
  end
  it "says shows it's commands", :vcr do
    really_long_text = "*Weather Bot* - This bot tells you the weather.\n\n"\
    "*Commands:*\n*clouds* - Tells you how many clouds there're above you.\n"\
    "*command_without_description*\n*What's the weather in <city>?* - Tells"\
    " you the weather in a <city>.\n*Music Buddy* - Your friendly neighbor, "\
    "who knows a little bit too much about music\n\n*Commands:*\n*spotify* - "\
    'Usage: `spotify` + `your search`Posts the best result for `your search` '\
    "on spotify\n*youtube* - Usage: `youtube` + `your search`Posts the best "\
    "result for `your search` on youtube\n\n*Other commands:*\n*help* - Shows "\
    "help information.\n*hi* - Says hello.\n*hello* - Says hello.\n\nFor "\
    "getting description of the command use: *help <command>*\n\nFor more"\
    " information see https://github.com/slack-ruby/slack-ruby-bot, please.\n"
    expect(
      message: "#{SlackRubyBot.config.user} help"
    ).to respond_with_slack_message(
      really_long_text
    )
  end
end
