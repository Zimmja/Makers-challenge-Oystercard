require 'journey'

describe Journey do
  let(:journey_complete) { Journey.new("Waterloo", "Tokyo") }
  let(:journey_incomplete) { Journey.new("Waterloo", nil) }

  describe '#fare' do
    it 'returns the MIN_FARE if journey is completed' do
      expect(journey_complete.fare).to eq Journey::MIN_FARE
    end

    it 'returns the PENALTY_FARE if journey is not completed' do
      expect(journey_incomplete.fare).to eq Journey::PENALTY_FARE
    end
  end

  describe '#finish' do
    it 'sets the @exit_station variable to the exit station' do
      expect(journey_incomplete.finish("Cuba")).to eq "Cuba"
    end
  end

end