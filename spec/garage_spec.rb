require 'garage'

describe 'Garage' do

	class ContainerHolder; include BikeContainer; end
	# let(:station) { DockingStation.new(capacity: 204) }

	# it 'allows setting default capacity on initialising' do
	# 	expect(station.capacity).to eq 204
	# end

	it 'can fix bikes' do
		bike = Bike.new
		broken_bike = bike.break!
		holder = ContainerHolder.new
		holder.dock(bike)
		expect(holder).to eq bike
	end
end

