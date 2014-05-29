Dir["./lib/*.rb"].each {|file| require file }

class Person
	
	def initialize(bike=nil)
		@bike = bike
	end

	def rent_bike_from(station, bike)
		@bike = station.release(bike) if !has_bike?
		self
	end

	def has_accident
		@bike.break!
	end

	def return_bike_to(station)
		station.dock(@bike) if has_bike?
		@bike = nil
		self
	end
	
	def has_bike?
		!@bike.nil?

	end
end