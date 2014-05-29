require 'garage'

describe 'Garage' do

	
	let(:garage) { Garage.new(capacity: 50) }

	it 'allows setting default capacity on initialising' do
		expect(garage.capacity).to eq 50
	end

	it 'can fix bikes' do
		broken_bike = Bike.new.break!
		garage.dock(broken_bike)
		garage.fix_bikes!
		expect(broken_bike).to_not be_broken
	end
end