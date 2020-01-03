# frozen_string_literal: true

require 'dotenv/load'

task :environment do
  ENV['SLACK_API_TOKEN'] = process.env.SLACK_API_TOKEN unless defined?(ENV['SLACK_API_TOKEN'])
end
namespace :deploy do
  desc 'start mybot'
  task :run => :environment do
    require_relative 'bin/main'
  end
end