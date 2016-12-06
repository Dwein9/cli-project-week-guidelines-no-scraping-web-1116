require 'rest-client'
require 'pry'
require "json"

class ToiletCLI

  def call
    puts "Welcome, we will help you find an open toilet in NYC!!!"
    run
  end

  def handicap?
    gets.chomp.strip.downcase
  end

  def get_user_input
    gets.chomp.strip
  end

  def run
    borough = ["manhattan", "bronx", "queens", "staten island", "bronx"]

    print "What borough are you in?: "
    input = get_user_input.downcase
    if input == "help"
      help
    elsif input == "exit"
      exit
    elsif borough.include?(input)
      search(input)
    else
      puts "Please enter a proper borough name!"
      run
    end
    run
  end

  def help
    puts "Type 'exit' to exit"
    puts "Type 'help' to view this menu again"
    puts "Type a borough of NYC to see the location of public toilets in your borough:"
  end

  def search(input)
    search_term = input
    # puts "Your search term was #{search_term}, I am searching..."
    new_toilet = ToiletData.new
    new_toilet.fetch_toilets(search_term)
    render_toilet(search_term)
  end

  def render_toilet(search_term)
    toilets = ToiletLocation.all

    print "Do you need a handicap accessible toilet? "
      answer = handicap?

      if answer == "yes"
        puts "These are all the open handicapped toilets in #{search_term.capitalize}"
        puts "--------------------------"
        toilets.each do |toilet|
          handicapped(toilet)
        end
      elsif answer == "no"
        puts "These are all the open toilets in #{search_term.capitalize}"
        puts "--------------------------"
        toilets.each do |toilet|
          display(toilet)
        end
      elsif answer == "help"
        help
      elsif answer == "exit"
        exit
      else
        puts "Please enter 'yes' or 'no'."
        render_toilet(search_term)
      end
  end

  def display(toilet)
    puts toilet.location
    puts "--------------------------" #every location in borough
  end

  def handicapped(toilet)
    if toilet.handicap_accessible
      puts toilet.location
      puts "--------------------------"
    end
  end

end
