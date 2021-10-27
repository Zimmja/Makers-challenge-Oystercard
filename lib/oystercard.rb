class Oystercard

  attr_reader :balance, :max_balance, :min_balance, :entry_station, :exit_station, :journey_list

  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  
  def initialize(balance = DEFAULT_BALANCE, max_balance = MAX_BALANCE, min_balance = MIN_BALANCE, entry_station = nil, exit_station = nil)
    @balance = balance
    @max_balance = max_balance
    @min_balance = min_balance
    @entry_station = entry_station
    @exit_station = exit_station
    @journey_list = []
  end

  def top_up(value)
    fail "this top_up would exceed maximum balance" if value+balance > @max_balance
    @balance += value
  end

  def touch_in(entry_station)
    fail 'Error: insufficient funds' if @balance < @min_balance
    @entry_station = entry_station
    @exit_station = nil
    "your current balance is £#{@balance}"
  end

  def touch_out(exit_station)
    deduct(@min_balance)
    @exit_station = exit_station
    @journey_list << { entry_station: @entry_station, exit_station: @exit_station }
    @entry_station = nil
    "your current balance is £#{@balance}"
  end
end

  def in_journey?
    !!entry_station
  end

private

def deduct(value)
  fail "this journey would take your balance below the minimum balance" if balance-value < @min_balance
  @balance -= value
end