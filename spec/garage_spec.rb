require 'garage'
require 'bikes'

describe Garage do
	let(:bike){Bike.new}
	let (:storage) {Garage.new(:capacity => 60)}

	it 'fixes a bike once docked in' do
		broken_bike_A,broken_bike_B=Bike.new, Bike.new
		broken_bike_A.break!
		broken_bike_B.break!
		group_of_bikes=[broken_bike_A,broken_bike_B]
		storage.load_bikes(group_of_bikes)
		storage.fix(group_of_bikes)
		expect(storage.bikes).to eq storage.available_bikes
	end

end