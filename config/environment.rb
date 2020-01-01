# frozen_string_literal: true

require 'dotenv/load'
require 'bundler/setup'
Bundler.require
require_relative '../lib/bot'
SlackRubyBot::Client.logger.level = Logger::WARN
