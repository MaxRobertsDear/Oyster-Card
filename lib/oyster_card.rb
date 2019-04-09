class OysterCard

  CARD_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "card limit of £#{ CARD_LIMIT } reached" if limit_exceeded?(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount 
  end

  private

  def limit_exceeded?(amount)
    user_top_up = @balance + amount
    user_top_up > CARD_LIMIT
  end

end
