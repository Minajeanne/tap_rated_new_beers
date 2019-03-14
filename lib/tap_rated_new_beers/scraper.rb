# require 'pry'
require_relative '../tap_rated_new_beers.rb'
class TapRatedNewBeers::Scraper

  def self.index_url
    Nokogiri::HTML(open("https://www.beeradvocate.com/lists/new/"))
  end

  def self.scrape_index_page
    table_row_nodes = self.index_url.css("table").css("tr")
    table_row_nodes = table_row_nodes.slice(2, 50)


    table_row_nodes.each do |beer_row|
      rank = beer_row.css("td")[0].text
      name = beer_row.css("td")[1].css("a").first.text
      beer_url = beer_row.css("td")[1].css("a").first.attributes["href"].value

      temp_beer = TapRatedNewBeers::Beer.new(name)
      temp_beer.rank = rank
      temp_beer.beer_url = beer_url
    end
  end

  def self.scrape_beer_page
    TapRatedNewBeers::Beer.all.each do |beer|
    beer_page = Nokogiri::HTML(open(beer.beer_url))

    beer_page.css(span.BAscore_big span.ba-ravg).text
    binding.pry
    end
  end

  # def make_beers
  #   scrape_beers.each do |beer|
  #     TapRatedNewBeers::Beer.new_from_index_page(beer)
  #   end
  # end

  # def doc
  #    @doc ||= Nokogiri::HTML(open(self.url))
  # end

end
# TapRatedNewBeers::Scraper.scrape_index_page
