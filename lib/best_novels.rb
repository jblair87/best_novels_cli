require_relative "./best_novels/version"
require_relative "./best_novels/cli"
require_relative "./best_novels/novel"
require_relative "./best_novels/scraper"

require "pry"
require "nokogiri"
require 'open-uri'
require 'colorize'




module BestNovels
  class Error < StandardError; end
  # Your code goes here...
end
