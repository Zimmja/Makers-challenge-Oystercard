class Journey
  attr_reader :entry_station, :exit_station

  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def fare
    journey_completed? ? MIN_FARE : PENALTY_FARE
  end

  def finish(exit_station)
    @exit_station = exit_station
  end

  private

  def journey_completed?
    !!(@entry_station && @exit_station)
  end

end