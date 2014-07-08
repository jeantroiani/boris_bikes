class DockingStation

DEFAULT_CAPACITY=10
	
	def initialize(options ={})
		@capacity = options.fetch(:capacity,DEFAULT_CAPACITY)
		@bikes = []
	end


	def bike_count
		@bikes.count
	end

	def dock(number_of_bikes)
		raise "Station is full" if full?
		@bikes << number_of_bikes
	end

	def release(bikes)
		@bikes.delete(bikes)
	end

	def full?
		bike_count == @capacity
	end

	def available_bikes
		@bikes.reject {|bike|bike.broken?}
	end
end

