require 'pry'
require 'nokogiri'
require 'httparty'
require 'open-uri'

module TapRatedNewBeers
  require_relative 'tap_rated_new_beers/version.rb'
  require_relative 'tap_rated_new_beers/cli.rb'
  require_relative 'tap_rated_new_beers/scraper.rb'
  require_relative 'tap_rated_new_beers/beer.rb'
end
