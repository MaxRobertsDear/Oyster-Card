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

  describe '#deduct' do
    it 'deducts 10 from the oyster card' do 
      subject.top_up(20)
      expect { subject.deduct(10)}.to change { subject.balance }.by -10
    end
  end

  describe '#in_journey?' do
    it 'is initially not in_journey' do
      expect(subject).not_to be_in_journey
    end

    it 'raises error if insufficient funds on touch_in' do
      expect { subject.touch_in }.to raise_error "insufficient funds" 
    end
    
    # it 'can touch_in' do
    #   subject.touch_in
    #   expect(subject).to be_in_journey
    # end

    # it 'can touch_out' do
    #   subject.touch_in 
    #   subject.touch_out
    #   expect(subject).not_to be_in_journey
    # end
  end




end
