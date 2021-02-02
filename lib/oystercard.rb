class Oystercard

  TOP_UP_LIMIT = 90

  attr_reader :balance, :journey

  def initialize
    @balance = 0
    @journey = false 
  end

  def top_up (value)
    raise "You have exceeded the £#{TOP_UP_LIMIT} limit" if @balance + value > TOP_UP_LIMIT
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def touch_in
    @journey = true
  end

  def touch_out
    @journey = false
  end

  def in_journey?
    @journey
  end

end
