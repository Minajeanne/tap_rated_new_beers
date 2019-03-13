require_relative '../tap_rated_new_beers.rb'

class TapRatedNewBeers::Scraper

  def self.get__index_page(index_url)
    index_url = Nokogiri::HTML(open("https://www.beeradvocate.com/lists/new/"))
    beers = []
       binding.pry
    end

    def self.get_profile_page(profile_slug)
      beer = {}
      profile_page = Nokogiri::HTML(open(profile_slug))
      links = profile_page.css()
      end

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
TapRatedNewBeers::Scraper.get_page
