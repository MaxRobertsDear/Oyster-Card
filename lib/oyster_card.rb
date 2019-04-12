class OysterCard

  CARD_LIMIT = 90
  MINIMUM_CHARGE = 1
  attr_reader :balance, :entry_station, :exit_station, :journeys, :journey 
  

  def initialize
    @balance = 0
    @in_journey = in_journey
    @journeys = []
  end

  def top_up(amount)
    raise "card limit of £#{ CARD_LIMIT } reached" if limit_exceeded?(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    fail "insufficient funds" if @balance < MINIMUM_CHARGE
    @in_journey = true
    @entry_station = entry_station 
    @journey = { entry_station: @entry_station }
  end

  def touch_out(exit_station)
    deduct(MINIMUM_CHARGE)
    @in_journey = false
    @exit_station = exit_station
    @journey[:exit_station] = @exit_station 
    @entry_station = nil 
    update_journeys
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

  def update_journeys
    @journeys << journey
  end

end
