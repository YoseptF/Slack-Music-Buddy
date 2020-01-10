# frozen_string_literal: true

require 'net/http'
require 'uri'

class MyHttp
  # Makes an http request with an auth token
  def self.get(text_url)
    puts text_url
    uri = URI.parse(text_url)

    request = Net::HTTP::Get.new(uri)
    request['Accept'] = 'application/json'

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    response
  end

  def self.post_basic(text_url, token)
    uri = URI.parse(text_url)

    request = Net::HTTP::Post.new(uri)
    request['Authorization'] = "Basic #{token}"

    request.set_form_data(
      'grant_type' => 'client_credentials'
    )

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    response
  end

  def self.get_bearer(text_url, token)
    uri = URI.parse(text_url)

    request = Net::HTTP::Get.new(uri)
    request['Authorization'] = "Bearer #{token}"

    req_options = {
      use_ssl: uri.scheme == 'https'
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end
    response
  end
end
