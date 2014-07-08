require 'docking_station'


describe DockingStation do
	
	let(:station) {DockingStation.new(capacity: 20)}

	it'should allow setting default capacity on initializing' do
		expect(station.capacity).to eq(20)
end
	

end