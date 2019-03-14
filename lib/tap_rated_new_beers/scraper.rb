require_relative '../tap_rated_new_beers.rb'
require 'pry'
class TapRatedNewBeers::Scraper
# add back self.
  def get_index_page
    Nokogiri::HTML(open("https://www.beeradvocate.com/lists/new/"))
    end

    def scrape_index_page
      binding.pry
      self.get_index_page.css("table")
    end

    # def scrape_beers
    #
    # end
    #
    # def make_beers
    #   scrape_beers.each do |beer|
    #     TapRatedNewBeers::Beer.new_from_index_page(beer)
    #   end
    # end
end
TapRatedNewBeers::Scraper.get_index_page
