require'pry'
require 'json'
require 'rest-client'

class ToiletData

  attr_reader :toilet_data

  # URL = "https://data.cityofnewyork.us/resource/r27e-u3sy.json"

  def initialize
    @toilet_data = JSON.parse(RestClient.get("https://data.cityofnewyork.us/resource/r27e-u3sy.json"))
  end

  def fetch_toilets(borough)
    toilets_array = []
    @toilet_data.each do |toilet|
      if toilet["borough"].downcase == borough.downcase
        if toilet["open_year_round"] == "Yes"
        ToiletLocation.new(toilet["location"], toilet["handicap_accessible"], toilet["borough"])
        end
      end
    end
  end
end
#
# toi = ToiletApi.new
# binding.pry
