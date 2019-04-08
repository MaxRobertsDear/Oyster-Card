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
      expect { subject.top_up(10)}.to change{ subject.balance }.by 10
    end

    it 'raises an error when card limit of 90 is reached' do
      subject.top_up(90)
      expect { subject.top_up(1)}.to raise_error 'card limit of 90 reached'
    end
  end
end

