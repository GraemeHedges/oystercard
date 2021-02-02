class Oyster_card

    TOP_UP_LIMIT = 90

    attr_reader :balance

    def initialize
        @balance = 0
    end

    def top_up (value)
        raise "You have exceeded the £#{TOP_UP_LIMIT} limit" if @balance + value > TOP_UP_LIMIT
        @balance = balance + value
    end
end
