require_relative 'journey'
require_relative 'station'

class Oystercard

  attr_reader :balance, :max_balance, :min_balance, :journey_list, :current_journey

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  
  def initialize(balance = DEFAULT_BALANCE, max_balance = MAX_BALANCE, min_balance = MIN_BALANCE)
    @balance = balance
    @max_balance = max_balance
    @min_balance = min_balance
    @journey_list = []
    @current_journey = nil
  end

  def top_up(value)
    top_up_check(value)
    @balance += value
  end

  def touch_in(entry_station)
    apply_fine_if_active_journey
    touch_in_check
    @current_journey = Journey.new(entry_station)
    current_balance
  end

  def touch_out(exit_station)
    @current_journey = Journey.new if @current_journey == nil
    finish_journey(exit_station) 
    close_down_journey
  end

  private

  def apply_fine_if_active_journey
    close_down_journey if @current_journey != nil
  end

  def finish_journey(station)
    @current_journey.finish(station) 
  end

  def close_down_journey
    deduct(@current_journey.fare)
    add_journey
    current_balance
  end

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
    close_down_journey if @current_journey != nil
  end

  def finish_journey(station)
    @current_journey.finish(station) 
  end

  def close_down_journey
    deduct(@current_journey.fare)
    add_journey
    current_balance
  end

  def deduct(value)
    @balance -= value
  end

  def add_journey
    @journey_list << @current_journey
    reset_journey
  end

  def reset_journey
    @current_journey = nil
  end

end