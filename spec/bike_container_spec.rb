 require './lib/bike_container'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	
	let(:holder) { ContainerHolder.new }
	let(:bike) { Bike.new }
	let(:broken_bike) do
		bike = Bike.new
		bike.break!
		bike
	end
	
	def fill_holder(holder)
		holder.capacity.times { holder.dock(Bike.new) }
	end	  

	it 'accepts a bike' do
		expect(holder.bike_count).to eq 0
		holder.dock(bike)
		expect(holder.bike_count).to eq 1
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
		expect{holder.dock(bike)}.to raise_error(RuntimeError)
	end

	it 'provides list of available bikes' do
		holder.dock(bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([bike])
	end	

end