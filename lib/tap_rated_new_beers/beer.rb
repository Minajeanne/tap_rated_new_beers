class TapRatedNewBeers::Beer

attr_accessor :name, :brewery, :style, :abv, :ratings, :score, :location, :url, :availability, :notes

@@all = []

  def self.new_from_index_page(b)
    self.new()
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

  def doc
     @doc ||= Nokogiri::HTML(open(self.url))
   end


end
