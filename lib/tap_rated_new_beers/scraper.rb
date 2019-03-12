class TapRatedNewBeers::Scraper

  def get_page
      Nokogiri::HTML(open("https://www.beeradvocate.com/lists/new/"))
    end

    def scrape_beers
      self.get_page.css()
    end

    def make_beers
      scrape_beers.each do |b|
        TapRatedNewBeers::Beer.new_from_index_page(b)
      end
    end


end
