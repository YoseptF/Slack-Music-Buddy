# frozen_string_literal: true

require_relative('../lib/youtube.rb')

describe Youtube do
  context 'recieves a string, searches it on spotify and returns' do
    it 'the link if it exist', :vcr do
      expect(Youtube.search('my way')).to eql('https://youtu.be/qQzdAsjWGPg')
    end
    it "an erorr if it doesn't exist", :vcr do
      fail_yt_message = 'youtube search engineasd vqwionbrd3498 23i '\
      'bn35rb13qt5 31285 t1432q'
      fail_return = "sorry I didn't find anything, can you be more specific :D?"
      expect(Youtube.search(fail_yt_message)).to eql(fail_return)
    end
  end
end
