require 'journey_log'

describe JourneyLog do
  let(:entry_station) { double(:entry_station) }

  describe '#initialize' do
    it 'initializes with @journey_list as an empty array' do
      expect(subject.journey_list).to eq []
    end

    it 'initializes with @journey blank' do
      expect(subject.current_journey).to eq nil
    end
  end

  describe '#start' do

    it 'expects current journey to have a value when called' do
      subject.start(entry_station)
      expect(subject.current_journey).to_not eq nil
    end
  end

  describe '#finish' do
    it 'expects current @journey to have no value when called' do
      subject.start(entry_station)
      subject.finish
      subject.add_journey
      expect(subject.current_journey).to eq nil
    end

    it 'logs @journey within @journey_list' do
      subject.start(entry_station)
      subject.finish
      expect { subject.add_journey }.to change { subject.journey_list.length }.by(1)
    end
  end
end