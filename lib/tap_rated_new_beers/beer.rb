class TapRatedNewBeers::Beer
attr_accessor :name, :rank, :beer_url, :brewery, :style, :abv, :ratings, :score, :location, :brewery_url, :availability, :notes

@@all = []

  def initialize(name = nil)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
end

# beer_rank = doc.css("table").css("tr")[2].css("td")[0].text
# beer_name = doc.css("table").css("tr")[2].css("td")[1].css("a").first.text
# beer_link = doc.css("table").css("tr")[2].css("td")[1].css("a").first.attributes["href"].value
# __________2nd level
# brewery = doc.css(".pageContentnoBorderRadiusBottom".css("info_box.break").css("a").x["href"].value
