class ToiletLocation

  attr_reader :location, :handicap_accessible #:borough, , :name, :open_year_round

  ALL = []

  def initialize(location, handicap_accessible)
    @location = location
    # @borough = borough
    @handicap_accessible = handicap_accessible
    # @name = name
    # @open_year_round = open_year_round
    ALL << self
  end

  def self.all
    ALL
  end

  # def handicap_accessible?
  #   if @handicap_accessible
  #     @handicap_accessible
  #   else
  #     "No information available."
  #   end
  # end

end
