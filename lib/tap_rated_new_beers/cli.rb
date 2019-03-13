require_relative '../tap_rated_new_beers.rb'

# CLI Controller
class TapRatedNewBeers::CLI

  def call
    list_beers
    exit_cli
  end

  def list_beers
    puts "Please wait while we brew your beers..."
    sleep(4)
    puts ""
    puts "Top Rated Beers: New"
    # list beers here
    puts ""
    # input = nil
    # while input != 'exit'
    puts "Select the rank number of the beer you'd like to sample or type 'exit':"
      input = gets.strip.downcase

    beer = TapRatedNewBeers::Beer.find(input.to_i)

    print_beers(beer)

    puts ""
    puts "Would you like to sample another beer? Y or N"

      input = gets.strip.downcase
        if input == "y"
          select_beer
        elsif input == "n"
          puts ""
          exit_cli
        else
          puts ""
          puts "Have you been drinking? Please try again."
          select_beer
         end
  end

  #     case input
  #     when "1"
  #       puts "Beer 1"
  #     when "2"
  #       puts "Beer 2"
  #     when "list"
  #       list_beers
  #     end
  #   end
  # end

  def exit_cli
    puts "Happy Drinking!"
  end

  def print_beers(beer)

  end

end
