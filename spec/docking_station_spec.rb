require 'docking_station'

describe 'Docking Station' do
	let(:station) { DockingStation.new }
	let(:bike) { Bike.new }

	it 'should accept a bike' do
		station.dock(bike)
		expect(station.bike_count).to eq 1	
	end

	it 'should release a bike' do
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq 0
	end

	it 'should know when it\'s full' do
		
	end

end