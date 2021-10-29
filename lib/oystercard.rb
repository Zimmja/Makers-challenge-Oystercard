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
    #forget_last_exit
    touch_in_check
    @current_journey = Journey.new(entry_station)
    #@entry_station = entry_station
    current_balance
  end

  def touch_out(exit_station)
    deduct(@min_balance)
    #@exit_station = exit_station
    #add_journey_hash
    current_balance
    #forget_last_entrance
  end

  # def in_journey?
  #   !!entry_station
  # end

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

  def deduct(value)
    deduct_check(value)
    @balance -= value
  end

  def deduct_check(value)
    fail "this journey would take your balance below the minimum balance" if @balance - value < @min_balance
  end

  # def forget_last_exit
  #   @exit_station = nil
  # end

  # def forget_last_entrance
  #   @entry_station = nil
  # end

  # def add_journey_hash
  #   @journey_list << { entry_station: @entry_station, exit_station: @exit_station }
  # end

end