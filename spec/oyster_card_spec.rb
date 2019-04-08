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
  
end
