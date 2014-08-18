require_relative 'bike_container'

class Garage

	include BikeContainer

	def initialize(option={})
		self.capacity=(option.fetch(:capacity,capacity))
	end

	def fix(group_bikes)
		group_bikes.each{|bike| bike.fix! }
	end

end

