require 'oystercard'
require 'journey'

describe Oystercard do
  let(:entry_station){ double(:entry_station) }
  let(:exit_station){ double(:exit_station) }

  describe '#initialize' do
    it 'has a default balance' do
      expect(subject.balance).to eq Oystercard::DEFAULT_BALANCE
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

      it 'raises an error when balance is below minimum balance' do
        expect { subject.touch_in(entry_station) }.to raise_error 'Error: insufficient funds'
      end

      it 'deducts the penalty fare from @balance if @current_journey is not nil' do
        subject.top_up(Oystercard::MAX_BALANCE)
        subject.touch_in(entry_station)
        expect { subject.touch_in(entry_station) }.to change { subject.balance }.by(-6)
      end
  end

  describe '#touch_out' do
 
    it 'deducts journey fare when touching out' do
      subject.top_up(Oystercard::MAX_BALANCE)
      subject.touch_in(entry_station)
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-(subject.min_balance))
    end

    it 'deducts the penalty fare from @balance if @current_journey IS nil' do
      subject.top_up(Oystercard::MAX_BALANCE)
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-6)
    end
  end
end