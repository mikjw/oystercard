class Oystercard
  attr_reader :balance

  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Top-up failed - maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + amount) > MAXIMUM_BALANCE 
    @balance += amount
  end

end
