class TapRatedNewBeers::CLI

  def call
    TapRatedNewBeers::Scraper.scrape_index_page
    list_beers
  end

  def list_beers
    puts "Please wait while we brew your beers...".blue.bold
    sleep(4)
    puts ""
    puts "Top Rated Beers: New".red.bold
    puts ""
      display_list
  end

  def display_list
    TapRatedNewBeers::Beer.all.each do |beer|
    puts "#{beer.rank}. #{beer.name}".blue.bold
    end
    select_beer
  end

  def select_beer
    puts "Select the rank number of the beer you'd like to sample:".red.bold
      input = gets.strip

      beer = TapRatedNewBeers::Beer.all.find do |beer|
        beer.rank == input
      end

    TapRatedNewBeers::Scraper.scrape_beer_page(beer)
    print_beer_info(beer)
  end


  def print_beer_info(beer)
     puts ""
     puts "::::::::::: #{beer.name} |_| Score: #{beer.score}/5 :::::::::::".blue.bold
     puts ""
     puts "Brewery:                 #{beer.brewery}".blue.bold
     puts "Location:                #{beer.location}".blue.bold
     puts "Website:                 #{beer.brewery_url}".blue.bold
     puts "Style:                   #{beer.style}".blue.bold
     puts "#{beer.abv}".blue.bold
     puts "Ratings:                 #{beer.ratings}".blue.bold
     puts "#{beer.availability}".blue.bold
     puts "::::::::::::::: Description ::::::::::::::::::".blue.bold
     puts ""
     puts "#{beer.notes}".blue.bold
     puts ""
     puts "::::::::::::::::::::::::::::::::::::::::::::::".blue.bold
     puts "Would you like to visit this brewery's website? Y or N".red.bold
     input = gets.strip.downcase

     case input
     when "y"
       beer.open_in_browser
       select_another
     when "n"
       select_another
     else
       puts ""
       puts "Have you been drinking? Please try again.".red.bold
       puts ""
       display_list
      end
 end

 def select_another
   puts "Would you like to sample another beer? Y or N".red.bold
   input = gets.strip.downcase

   case input
   when "y"
     display_list
   when "n"
     exit_cli
   else
     puts ""
     puts "Have you been drinking? Please try again.".red.bold
     puts ""
      display_list
    end
  end

  def exit_cli
    puts "Happy Drinking!".red.bold
  end
end
# end of Class
