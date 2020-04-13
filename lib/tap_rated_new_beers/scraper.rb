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
      temp_beer.beer_url = "https://www.beeradvocate.com" + beer_url
    end
  end

  def self.scrape_beer_page(beer)
    #self => Scraper
    beer_page = Nokogiri::HTML(open(beer.beer_url))

      beer.score = beer_page.css("div#info_box").css("dl.beerstats").css("dd.beerstats").css("span.ba-score.Tooltip").text
      beer.ratings = beer_page.css("div#info_box").css("dl.beerstats").css("dd.beerstats").css("span.ba-ratings.Tooltip").text
      beer.style = beer_page.css("div#info_box").css("dd.beerstats").css("a.Tooltip").css("b").text
      beer.abv = beer_page.css("div#info_box").css("dl.beerstats").css("dd.beerstats")[1].css("span.Tooltip b").text
      beer.availability = beer_page.css("div#info_box").css("dl.beerstats").css("dd.beerstats").css("span.Tooltip")[6].text
      beer.brewery = beer_page.css("div#info_box").css("dl.beerstats").css("dd.beerstats").css("a.Tooltip")[3].text
      beer.location = beer_page.css("div#info_box").css("dd.beerstats").css("a")[4].text + ", " + beer_page.css("div#info_box").css("dd.beerstats").css("a")[5].text
      beer.brewery_url = beer_page.css("div#info_box").css("dl.beerstats").css("dd.beerstats").css("a.Tooltip")[3].attributes["href"].value
      # array = beer_page.css("div#info_box").text.split("\n\n")
      beer_page_contents = beer_page.css("div#ba-content").css("div div text *").text.split("\n\n")

      beer_page_contents.each do |content|
        if content.include?("Notes:")
          beer.notes = content
        end
      binding.pry
      end
      # beer.notes = array.last
  end
end
# end of Class
