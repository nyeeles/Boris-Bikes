require 'person'

describe 'Person' do

	let(:bike) { Bike.new }
	let(:jake) { Person.new }
	let(:station) { DockingStation.new }


	# it 'can rent a bike from docking station' do
	# 	jake.rent_bike_from(station, bike)
	# 	expect(jake).to have_bike
	# end

	# it 'can break a bike' do
	# 	jake.rent(bike)
	# 	jake.breaks!(bike)
	# 	expect(bike).to be_broken
	# end

	# it 'can return bike' do
	# 	jake.rent(bike)
	# 	expect(jake).to have_bike
		
		# jake.return(bike)
		# expect(jake).to_not have_bike
	# end
end