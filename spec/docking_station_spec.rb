require 'docking_station'

describe 'Docking Station' do
	let(:station) { DockingStation.new(capacity: 204) }

	it 'allows setting default capacity on initialising' do
		expect(station.capacity).to eq 204
	end
end


