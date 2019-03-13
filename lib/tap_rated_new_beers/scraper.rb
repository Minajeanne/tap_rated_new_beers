require 'open-uri'
require 'nokogiri'
require 'pry'

class TapRatedNewBeers::Scraper

  def get_page
      Nokogiri::HTML(open("https://www.beeradvocate.com/lists/new/"))
    end
 binding.pry
    # def scrape_beers
    #   self.get_page.css()
    #   beers = []
    # end
    #
    # def make_beers
    #   scrape_beers.each do |b|
    #     TapRatedNewBeers::Beer.new_from_index_page(b)
    #   end
    # end
    #

end
