class OysterCard
  
  CARD_LIMIT = 90
  attr_reader :balance
  
  def initialize 
    @balance = 0
  end

  def top_up(input)
    raise "card limit of #{ CARD_LIMIT } reached" if limit_exceeded? 
    @balance += input
  end

  private

  def limit_exceeded?
    @balance >= CARD_LIMIT
  end

end
