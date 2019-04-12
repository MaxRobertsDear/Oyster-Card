require 'journey'

describe Journey do 

let(:journey) { described_class.new(entry_station, exit_station) }
let(:entry_station) { double :station }
let(:exit_station) { double :station }


  describe '#complete?' do
    it 'returns false by default' do
      expect(described_class.new.complete?).to be false 
    end

    it 'return true when journey complete' do
      expect(journey.complete?).to be true 
    end


  end


end
