require_relative 'journey'

class JourneyLog
  attr_reader :current_journey, :journey_list

  def initialize
    @current_journey = nil
    @journey_list = []
  end

  def start(entry_station = nil)
    @current_journey = Journey.new(entry_station)
  end

  def finish(exit_station = nil)
    @current_journey.finish(exit_station)
  end

  def add_journey
    @journey_list << @current_journey
    reset_journey
  end

  private

  def reset_journey
    @current_journey = nil
  end

  def active_journey
    @current_journey.nil? ? Journey.new : @current_journey
  end

end