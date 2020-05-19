# require "bundler/setup"
# Bundler.require 
require 'open-uri'
require "pry"
require "nokogiri"
require_relative "./nfl_lookup_tool/version"
require_relative "./nfl_lookup_tool/cli"
require_relative "./nfl_lookup_tool/teams.rb"
require_relative "./nfl_lookup_tool/scrapper.rb"
require_relative "./nfl_lookup_tool/players.rb"
require_relative "./nfl_lookup_tool/schedule.rb"

module NflLookupTool
  class Error < StandardError; end
  # Your code goes here...
end


