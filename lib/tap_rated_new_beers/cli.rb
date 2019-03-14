class TapRatedNewBeers::CLI

  def call
    TapRatedNewBeers::Scraper.scrape_index_page
    list_beers
    exit_cli
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
    puts "Select the rank number of the beer you'd like to sample or type 'exit':"
    input = nil
    while input != 'exit'
    input = gets.strip
      puts ""
      # if input = beer.rank
     print_beer_info
      # check if input = num
    end
    select_another
  end


  def print_beer_info
     puts ""
     # binding.pry
     puts "----------- #{beer.name} |_| #{beer.score} -----------"
     puts ""
     puts "Brewery:           #{beer.brewery}"
     puts "Location:          #{beer.location}"
     puts "Website:           #{beer.brewery_url}"
     puts "Style:             #{beer.style}"
     puts "ABV:               #{beer.abv}"
     puts "Ratings:           #{beer.ratings}"
     puts "Availability:      #{beer.availability}"
     puts ""
     puts "---------------Description--------------"
     puts ""
     puts "#{beer.notes}"
     puts ""
     select_another
 end

 def select_another
   puts "Would you like to sample another beer? Y or N"
     if input == "y"
       display_list
     elsif input == "n"
       puts ""
       exit_cli
     else
       puts ""
       puts "Have you been drinking? Please try again."
       display_list
    end
  end

  def exit_cli
    puts "Happy Drinking!"
  end
end
