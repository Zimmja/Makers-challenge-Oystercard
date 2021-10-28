require 'station'

describe Station do
    
  let(:station) { Station.new(name, zone) }
  let(:name) { double(:name) }
  let(:zone) { double(:zone) }

  it 'has a station name by default' do
    expect(station.name).to eq name
  end

  it 'has a station zone by default' do
    expect(station.zone).to eq zone
  end
end