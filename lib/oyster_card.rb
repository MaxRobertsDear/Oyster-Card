class OysterCard

  CARD_LIMIT = 90
  MINIMUM_CHARGE = 1
  attr_reader :balance
  attr_reader :entry_station 

  def initialize
    @balance = 0
    @in_journey = in_journey
    @entry_station = nil
  end

  def top_up(amount)
    raise "card limit of £#{ CARD_LIMIT } reached" if limit_exceeded?(amount)
    @balance += amount
  end

  def touch_in(station)
    fail "insufficient funds" if @balance < MINIMUM_CHARGE
    @in_journey = true
    @entry_station = station 
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @in_journey = false
    @entry_station = nil 
   
  end

  def in_journey?
    !!entry_station 
  end
  


  private
  
  attr_reader :in_journey

  def limit_exceeded?(amount)
    user_top_up = @balance + amount
    user_top_up > CARD_LIMIT
  end

  def deduct(amount)
    @balance -= amount 
  end
end
