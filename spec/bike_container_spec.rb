require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	
	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }

	it 'accepts a bike' do
		expect(holder.bike_count).to eq 0
		holder.dock(bike)
		expect(holder.bike_count).to eq 1
	end

	def add_ten_bikes
		10.times { holder.dock(bike) }
	end

	it 'releases a bike' do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq 0
	end

	it 'knows when it\'s full' do
		expect(holder).not_to be_full
		fill_holder(holder)
		expect(holder).to be_full
	end

	it 'doesn\'t accept a bike if full' do
		fill_holder(holder)
		expect(lambda {holder.dock(bike)}).to raise_error(RuntimeError)
	end

	it 'provides list of available bikes' do
		working_bike, broken_bike = Bike.new, Bike.new    
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end	

	def fill_holder(holder)
		holder.capacity.times { holder.dock(Bike.new) }
	end	  

end