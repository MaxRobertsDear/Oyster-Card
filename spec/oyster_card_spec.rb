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
      expect { subject.top_up(10) }.to change{ subject.balance }.from(0).to(10)
    end
  end
end
  

