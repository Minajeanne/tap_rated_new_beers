require_relative '../tap_rated_new_beers.rb'

class TapRatedNewBeers::Beer

attr_accessor :name, :brewery, :style, :abv, :ratings, :score, :location, :url, :availability, :notes

@@all = []

  def self.new_from_index_page(beer)
    self.new(beer.css("table").css("tr")[2].css("td")[0].text,
      beer.css("table").css("tr")[2].css("td")[1].css("a").first.text,
      beer.css("table").css("tr")[2].css("td")[1].css("a").first.attributes["href"].value
      )
      binding.pry
  end

  def initialize(name=nil, brewery=nil, style=nil, abv=nil, ratings=nil, score=nil)
    @name = name
    @brewery = brewery
    @style = style
    @abv = abv
    @ratings = ratings
    @score = score
    @@all << self
  end

  def self.all
    @@all
  end

  # def location
  #   @location ||=
  # end
  #
  # def url
  #   @url ||=
  # end
  #
  # def availability
  #   @availability ||=
  # end
  #
  # def notes
  #   @notes ||=
  # end

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
