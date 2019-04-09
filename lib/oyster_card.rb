class OysterCard

  CARD_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
    @in_journey = in_journey
  end

  def top_up(amount)
    raise "card limit of £#{ CARD_LIMIT } reached" if limit_exceeded?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount 
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey 
  end


  private
  
  attr_reader :in_journey

  def limit_exceeded?(amount)
    user_top_up = @balance + amount
    user_top_up > CARD_LIMIT
  end

end
