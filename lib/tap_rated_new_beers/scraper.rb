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
      temp_beer.beer_url = 'https://www.beeradvocate.com'+ beer_url
    end
  end

  def self.scrape_beer_page(beer)
    # binding.pry
    beer_page = Nokogiri::HTML(open(beer.beer_url))

      beer.score = beer_page.css("div#score_box").css("span.BAscore_big").css("span.ba-ravg").text
      beer.ratings = beer_page.css("div#score_box").css("span.ba-ratings").text
      beer.style = beer_page.css("div#info_box.break").css("a")[4].text
      beer.brewery = beer_page.css("div#info_box.break").css("a")[0].text
      beer.location = beer_page.css("div#info_box.break").css("a")[1].text + ", " + beer_page.css("div#info_box.break").css("a")[2].text
      beer.brewery_url = beer_page.css("div#info_box.break").css("a")[3].attributes["href"].value
      array = beer_page.css("div#info_box.break").text.split("\n\n")
      array.find do |phrase|
        if phrase.include?("%")
          beer.abv = phrase
        elsif phrase.include?("Availability")
          beer.availability = phrase
        end
      end
      beer.notes = array.last
       # binding.pry
  end

end
# end of Class


# def doc
#    @doc ||= Nokogiri::HTML(open(self.url))
# end
