# frozen_string_literal: true

require_relative('../lib/spotify.rb')

describe Spotify do
  context 'recieves a string, searches it on spotify and returns' do
    it 'the link if it exist', :vcr do
      expect(Spotify.search('my way')).to eql('https://open.spotify.com/track/4n7jnSxVLd8QioibtTDBDq')
    end
    it "an erorr if it doesn't exist", :vcr do
      expect(Spotify.search('crazy monkey banana')).to eql(
        "I couldn't find anything with those parameters D:"
      )
    end
  end
end
