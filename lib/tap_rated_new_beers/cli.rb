class TapRatedNewBeers::CLI

  def call
    TapRatedNewBeers::Scraper.scrape_index_page
    list_beers
    # exit_cli
  end

  def list_beers
    puts "Please wait while we brew your beers..."
    sleep(4)
    puts ""
    puts "Top Rated Beers: New"
    puts ""
      display_list
  end

  def display_list
    TapRatedNewBeers::Beer.all.each do |beer|
    puts "#{beer.rank}. #{beer.name}"
    end
    select_beer
  end

  def select_beer
    puts "Select the rank number of the beer you'd like to sample:"
      input = gets.strip
        if input == 'q'
          exit_cli
        end
      beer = TapRatedNewBeers::Beer.all.find do |beer|
        beer.rank == input
      end

    TapRatedNewBeers::Scraper.scrape_beer_page(beer)
    print_beer_info(beer)
  end


  def print_beer_info(beer)
     puts ""
     puts "----------- #{beer.name} |_| Score: #{beer.score}/5 -----------"
     puts ""
     puts "Brewery:                 #{beer.brewery}"
     puts "Location:                #{beer.location}"
     puts "Website:                 #{beer.brewery_url}"
     puts "Style:                   #{beer.style}"
     puts "#{beer.abv}"
     puts "Ratings:                 #{beer.ratings}"
     puts "#{beer.availability}"
     puts "---------------Description--------------"
     puts ""
     puts "#{beer.notes}"
     puts ""
     puts "----------------------------------------"
     select_another
 end

 def select_another
   puts "Would you like to sample another beer? Y or N"
   input = nil
   if input != 'exit'
     input = gets.strip
     if input == "y"
       display_list
     elsif input == "n"
       puts ""
       exit_cli
     else
       puts ""
       puts "Have you been drinking? Please try again."
       puts ""
       display_list
     end
    end
  end

  def exit_cli
    puts "Happy Drinking!"
  end

end
# if you add this to your beer class …. (stole this from avi vid) … def open_in_browser     system("open '#{url}'")   end you can call def open_in_browser on your individual beer url
