class TapRatedNewBeers::Beer

attr_accessor :name, :brewery, :style, :abv, :ratings, :score, :location, :url, :availability, :notes

@@all = []

def self.new_from_index_page(b)
  self.new()
end








end
