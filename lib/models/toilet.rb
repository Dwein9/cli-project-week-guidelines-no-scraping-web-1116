class ToiletLocation

  attr_reader :location, :handicap_accessible, :borough

  ALL = []

  def initialize(location, handicap_accessible, borough)
    @location = location
    @borough = borough
    @handicap_accessible = handicap_accessible
    # name = name
    # @open_year_round = open_year_round
    ALL << self
  end

  def self.all
    ALL
  end

end
