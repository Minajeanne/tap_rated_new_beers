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

  def open_in_browser
    system("open '#{brewery_url}'")
  end
end

z= 10000

def return()
"#{}"
end
