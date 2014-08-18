require_relative 'bike_container' 

class Van
	
	include BikeContainer

	def initialize(option={})
		self.capacity=(option.fetch(:capacity,capacity))
	end

end