require_relative '../tap_rated_new_beers.rb'
class TapRatedNewBeers::BeerRankings
attr_accessor :rank, :name, :url

@@all = []

  def self.new_from_index_page(beer)
    self.new(beer.css("table").css("tr")[2].css("td")[0].text,
      beer.css("table").css("tr")[2].css("td")[1].css("a").first.text,
      beer.css("table").css("tr")[2].css("td")[1].css("a").first.attributes["href"].value
      )
      binding.pry
  end

  def initialize(rank = nil, name = nil, url = nil)
    @rank = rank
    @name = name
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

  def rank
    @rank ||= doc.css("table").css("tr")[2].css("td")[0].text
  end

  def name
    @name ||= doc.css("table").css("tr")[2].css("td")[1].css("a").first.text
  end

  def url
    @url ||= doc.css("table").css("tr")[2].css("td")[1].css("a").first.attributes["href"].value
  end


  def self.find(rank)
    self.all(rank-1)
  end

  def doc
     @doc ||= Nokogiri::HTML(open(self.url))
   end
end

# beer_rank = doc.css("table").css("tr")[2].css("td")[0].text
# beer_name = doc.css("table").css("tr")[2].css("td")[1].css("a").first.text
# beer_link = doc.css("table").css("tr")[2].css("td")[1].css("a").first.attributes["href"].value
# __________2nd level
# brewery = doc.css(".pageContentnoBorderRadiusBottom".css("info_box.break").css("a").x["href"].value
