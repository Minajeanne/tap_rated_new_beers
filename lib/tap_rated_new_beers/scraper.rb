require_relative '../tap_rated_new_beers.rb'

class TapRatedNewBeers::Scraper
# add back self.
  def get_index_page
    Nokogiri::HTML(open("https://www.beeradvocate.com/lists/new/"))
    end

    def scrape_beers
      self.get_index_page.css("table")
       binding.pry
    end

    def make_beers
      scrape_beers.each do |beer|
        TapRatedNewBeers::Beer.new_from_index_page(beer)
      end
    end
end
TapRatedNewBeers::Scraper
