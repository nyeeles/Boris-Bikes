require 'docking_station'

describe 'Docking Station' do
	let(:station) { DockingStation.new(capacity: 20) }
	let(:bike) { Bike.new }

	def add_twenty_bikes
		20.times { station.dock(bike) }
	end

	it 'accepts a bike' do
		station.dock(bike)
		expect(station.bike_count).to eq 1	
	end

	it 'releases a bike' do
		station.dock(bike)
		station.release(bike)
		expect(station.bike_count).to eq 0
	end

	it 'knows when it\'s full' do
		expect(station).not_to be_full
		add_twenty_bikes
		expect(station).to be_full
	end

	it 'doesn\'t accept a bike if full' do
		add_twenty_bikes
		expect(lambda {station.dock(bike)}).to raise_error(RuntimeError)
	end

	it 'provides list of available bikes' do
		working_bike, broken_bike = Bike.new, Bike.new    
		  broken_bike.break!
		  station.dock(working_bike)
		  station.dock(broken_bike)
		  expect(station.available_bikes).to eq([working_bike])
	end	

end


