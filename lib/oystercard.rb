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
    fail "this top_up would exceed maximum balance" if value+balance > @max_balance  #  originally wrote as @balance > @max_balance - this didn't trigger the fail until it was over 91 and we had to have the original top up code first, then the fail, then return @balance. Refactored to what is seen and tests pass

    @balance += value
  end

  def touch_in(entry_station)
    forget_last_exit
    fail 'Error: insufficient funds' if @balance < @min_balance
    @entry_station = entry_station
    current_balance
  end

  def touch_out(exit_station)
    deduct(@min_balance)
    @exit_station = exit_station
    add_journey_hash
    current_balance
    forget_last_entrance
  end
end

  def in_journey?
    !!entry_station
  end

private

def current_balance 
  "your current balance is £#{@balance}"
end

def deduct(value)
  fail "this journey would take your balance below the minimum balance" if balance-value < @min_balance
  @balance -= value
end

def forget_last_exit
  @exit_station = nil
end

def forget_last_entrance
  @entry_station = nil
end

def add_journey_hash
  @journey_list << { entry_station: @entry_station, exit_station: @exit_station }
end