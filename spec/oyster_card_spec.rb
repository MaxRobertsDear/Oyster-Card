require 'oyster_card'

describe OysterCard do
  let(:oyster) {subject}
  describe '#balance' do
    it 'responds to balance' do
      expect(oyster).to respond_to :balance
    end
    it 'starts with 0 balance' do
      expect(oyster.balance).to eq 0
    end
  end
  describe '#top_up' do
    it 'tops the oyster card up by 10' do
      expect { oyster.top_up(10)}.to change { oyster.balance }.by 10
    end

    it 'raises an error when card limit of 90 is reached' do
      oyster.top_up(90)
      expect { oyster.top_up(1)}.to raise_error 'card limit of £90 reached'
    end
  end

  describe '#in_journey?' do
    let(:entry_station){ double :station }
    let(:exit_station){ double :station }
    let(:journey){{ entry_station: entry_station, exit_station: exit_station }}
    
    it 'is initially not in_journey' do
      expect(oyster).not_to be_in_journey
    end

    it 'raises error if insufficient funds on touch_in' do      
      expect { oyster.touch_in(entry_station) }.to raise_error "insufficient funds" 
    end
    context 'idk yet' do
      before :each do 
        oyster.top_up(50)
        oyster.touch_in(entry_station)
      end
      it 'charges the card on journey completion' do
        expect { oyster.touch_out(exit_station) }.to change{ oyster.balance }.by( - OysterCard::MINIMUM_CHARGE ) 
      end

      it 'stores the entry station' do   
        expect(oyster.entry_station).to eq entry_station
      end

      it 'stores the exit station' do
        oyster.touch_out(exit_station)
        expect(oyster.exit_station).to eq exit_station
      end
    end

    it 'shows a list of empty journeys on initialisation' do
      expect(oyster.journeys).to be_empty
    end

    it 'stores journeys' do
      oyster.top_up(50)
      oyster.touch_in(entry_station)
      oyster.touch_out(exit_station)
      expect(oyster.journeys).to include journey 
    end

  end
end
