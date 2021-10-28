require 'oystercard'

describe Oystercard do
  describe '#initialize' do
    it 'has a default balance' do
      expect(subject.balance).to eq Oystercard::DEFAULT_BALANCE
    end
    it "defaults to not in journey" do
      expect(subject.entry_station).to eq nil
    end
    it 'has an empty journey list' do
      expect(subject.journey_list).to eq []
    end
  end

  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'add money to the oystercard' do
      expect(subject.top_up(Oystercard::MAX_BALANCE)).to eq subject.balance
    end

    it 'raises error if balance exceeds maximum balance' do
      expect { raise StandardError, "this top_up would exceed maximum balance"}.to raise_error "this top_up would exceed maximum balance"
    end
  end

  describe '#touch_in' do
      it 'touches card in' do
        subject.top_up(Oystercard::MAX_BALANCE)
        subject.touch_in(entry_station)
        expect(subject.entry_station).to eq entry_station
      end

      it 'raises an error when balance is below minimum balance' do
        expect { subject.touch_in(entry_station) }.to raise_error 'Error: insufficient funds'
      end
  end

  describe '#touch_out' do
    it 'touches card out' do
      subject.top_up(Oystercard::MAX_BALANCE)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.entry_station).to eq nil
    end
      
    it 'deducts journey fare when touching out' do
      subject.top_up(Oystercard::MAX_BALANCE)
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-(subject.min_balance))
    end
  end

  describe '#journey_list' do
    it 'adds completed journey to journey list' do
      subject.top_up(Oystercard::MAX_BALANCE)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journey_list.count).to eq 1
    end
  end

  let(:entry_station){ double(:entry_station) }
  it 'saves entry station' do
    subject.top_up(Oystercard::MAX_BALANCE)
    subject.touch_in(entry_station)
    expect(subject.entry_station).to eq entry_station
  end
  let(:exit_station){ double(:exit_station) }
    it 'saves entry station' do
      subject.top_up(Oystercard::MAX_BALANCE)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq exit_station
  end
end