module BikeContainer

	DEFAULT_CAPACITY=10
	
	def bikes
		@bikes ||=[]
	end

	def capacity
		@capacity ||=DEFAULT_CAPACITY	
	end

	def capacity=(value)
		@capacity = value
	end
	
	def bike_count
		bikes.count
	end

	def dock(number_of_bikes)
		raise "Station is full" if full?
		@bikes << number_of_bikes
	end

	def release(bike)
		@bikes.delete(bike)
	end

	def full?
		bike_count == capacity
	end

	def available_bikes
		bikes.reject {|bike|bike.broken?}
	end

	def broken_bikes
		bikes.select {|bike|bike.broken?}
	end

	def load_bikes(group_bikes)
		group_bikes.each{|bike| dock(bike) }

	end

	def release_bikes(group_bikes)
		group_bikes.each {|bike| release(bike)}
	end

end

