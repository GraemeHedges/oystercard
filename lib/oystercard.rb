class Oystercard

  TOP_UP_LIMIT = 90

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up (value)
    raise "You have exceeded the £#{TOP_UP_LIMIT} limit" if @balance + value > TOP_UP_LIMIT
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end 

end
