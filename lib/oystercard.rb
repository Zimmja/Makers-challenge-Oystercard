require_relative 'journey'
require_relative 'journey_log'
require_relative 'station'

class Oystercard

  attr_reader :balance, :max_balance, :min_balance, :journey_log

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  
  def initialize(balance = DEFAULT_BALANCE, max_balance = MAX_BALANCE, min_balance = MIN_BALANCE)
    @balance = balance
    @max_balance = max_balance
    @min_balance = min_balance
    @journey_log = JourneyLog.new
  end

  def top_up(value)
    top_up_check(value)
    @balance += value
  end

  def touch_in(entry_station)
    apply_fine_if_active_journey
    touch_in_check
    @journey_log.start(entry_station)
    current_balance
  end

  def touch_out(exit_station)
    @journey_log.start if @journey_log.current_journey == nil
    finish_journey(exit_station) 
    close_down_journey
    @journey_log.add_journey
  end

  private

  def top_up_check(value)
    fail "this top_up would exceed maximum balance" if value + @balance > @max_balance
  end

  def touch_in_check
    fail 'Error: insufficient funds' if @balance < @min_balance
  end

  def current_balance 
    "your current balance is £#{@balance}"
  end

  def apply_fine_if_active_journey
    close_down_journey if @journey_log.current_journey != nil
  end

  def finish_journey(station)
    @journey_log.finish(station) 
  end

  def close_down_journey
    deduct(@journey_log.current_journey.fare)
    current_balance
  end

  def deduct(value)
    @balance -= value
  end
end