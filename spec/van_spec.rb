=begin
it moves bikes form the station to the garage
it moves bikes from garage to station
van accept bikes
van releases bikes
van has a capacity
=end

require 'van'

describe Van do
	let (:transport) {Van.new(:capacity => 5)}

	it'creates a van with capacity of 5 bikes' do
		expect(transport.capacity).to eq 5
	end


	






end
