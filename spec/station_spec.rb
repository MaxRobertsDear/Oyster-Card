require 'station'

describe Station do 
  describe 'associates a station with a zone' do
    
    it 'returns Aldgate station' do 
      expect(subject.entry("Aldgate")).to eq "Aldgate"
    end  
    
    it 'returns the zone' do
      expect(subject.zone("Aldgate")).to eq 1 
    end
  
  end
end

