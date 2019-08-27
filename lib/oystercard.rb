class Oystercard
  attr_reader :balance
  attr_reader :in_use

  MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "Top-up failed - maximum balance of #{MAXIMUM_BALANCE} exceeded" if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_use = true
  end

  def in_journey?
    @in_use = false
  end

  def touch_out
    @in_use = false
  end
end
