require 'oyster_card'

describe OysterCard do
  describe '#balance' do
    it 'responds to balance' do
      expect(subject).to respond_to :balance
    end
    it 'starts with 0 balance' do
      expect(subject.balance).to eq 0
    end
  end
  describe '#top_up' do
    it 'tops the oyster card up by 10' do
      expect { subject.top_up(10)}.to change { subject.balance }.by 10
    end

    it 'raises an error when card limit of 90 is reached' do
      subject.top_up(90)
      expect { subject.top_up(1)}.to raise_error 'card limit of £90 reached'
    end
  end

  describe '#in_journey?' do
    let(:entry_station){ double :station }
    let(:exit_station){ double :station }
    let(:journey){{ entry_station: entry_station, exit_station: exit_station }}
    



    it 'is initially not in_journey' do
      expect(subject).not_to be_in_journey
    end

    it 'raises error if insufficient funds on touch_in' do      
      expect { subject.touch_in(entry_station) }.to raise_error "insufficient funds" 
    end
    context 'idk yet' do
      before :each do 
        subject.top_up(50)
        subject.touch_in(entry_station)
      end
      it 'charges the card on journey completion' do
        expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by( - OysterCard::MINIMUM_CHARGE ) 
      end

      it 'stores the entry station' do   
        expect(subject.entry_station).to eq entry_station
      end

      it 'stores the exit station' do
        subject.touch_out(exit_station)
        expect(subject.exit_station).to eq exit_station
      end
    end

    it 'shows a list of empty journeys on initialisation' do
      expect(subject.journeys).to be_empty
    end

    it 'stores journeys' do
      subject.top_up(50)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journeys).to include journey 
    end

  end
end
