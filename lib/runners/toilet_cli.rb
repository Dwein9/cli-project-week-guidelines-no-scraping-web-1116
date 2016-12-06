require 'rest-client'
require 'pry'
require "json"

class ToiletCLI

  def call
    puts "Welcome, do you have to go to the bathroom?"
    run
  end


  def get_user_input
    gets.chomp.strip
  end

  def run
    print "What borough are you in?: "
    input = get_user_input
    if input == "help"
      help
    elsif input == "exit"
      exit
    else
      search(input)
    end
    run
  end

  def help
    puts "Type 'exit' to exit"
    puts "Type 'help' to view this menu again"
    puts "Type a borough of NYC to see the location of public toilets in your borough:"
  end

  def search(input)
    search_term = input.capitalize
    puts "Your search term was #{search_term}, I am searching..."
    new_toilet = ToiletData.new
    new_toilet.fetch_toilets(search_term)
    render_toilet
  end

  def render_toilet
    toilets = ToiletLocation.all
    toilets.each do |toilet|
      display(toilet)
    end
  end

  def display(toilet)
    puts toilet.location
  end
end









    # toilet_hash = JSON.parse(RestClient.get("https://data.cityofnewyork.us/resource/r27e-u3sy.json"))








    #toilet_hash is an array, works.

    #collect all the toilets that == input, and return location

  #
  #   albums = ExampleApi.new(url).make_albums
  #   puts "Thank you for your patience. I found this on Spotify:"
  #   albums.each do |album|
  #     puts album.example
  #   end
  # end

#
# toi = ToiletCLI.new.search("Bronx")
