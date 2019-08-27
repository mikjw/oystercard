class Oystercard
  attr_reader :balance
  attr_reader :in_use

  MAXIMUM_BALANCE = 90
  MIN_BALANCE = 1

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
    fail 'Insufficient funds for journey' if @balance < 1
    @in_use = true
  end

  def in_journey?
    @in_use = false
  end

  def touch_out
    deduct(MIN_BALANCE)
    @in_use = false
  end

  private 

  def deduct(amount)
    @balance -= amount
  end
end
