require 'bike_container'
require 'bikes'

class ContainerHolder; include BikeContainer; end

describe BikeContainer do
	
	let(:bike){Bike.new}
	let(:holder){ContainerHolder.new}

	
	it 'should accept a bike' do		
		expect(holder.bike_count).to eq 0
		holder.dock(bike)
		expect(holder.bike_count).to eq 1
	end

	it'should release a bike' do
		holder.dock(bike)
		holder.release(bike)
		expect(holder.bike_count).to eq 0
	end

	it'should know when the dock is full' do
		expect(holder).not_to be_full
		(holder.capacity).times {holder.dock(Bike.new)}
		expect(holder).to be_full
	end
	
	it'should not accept a bike if it is full' do
		(holder.capacity).times {holder.dock(Bike.new)}
		expect(lambda{holder.dock(bike) }).to raise_error(RuntimeError)
	end
	
	it 'should provide a list of available bikes' do
		working_bike, broken_bike= Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.available_bikes).to eq([working_bike])
	end

	it 'should provide a list of broken bikes' do
		working_bike, broken_bike= Bike.new, Bike.new
		broken_bike.break!
		holder.dock(working_bike)
		holder.dock(broken_bike)
		expect(holder.broken_bikes).to eq([broken_bike])
	end

	it 'should load a group of bikes' do
			working_bike, broken_bike= Bike.new, Bike.new
			broken_bike.break!
			group_of_bikes=[working_bike,broken_bike]
			holder.load_bikes(group_of_bikes)
			expect(holder.bikes).to eq group_of_bikes 
	end

	it 'should release a group of bikes' do
		working_bike, broken_bike= Bike.new, Bike.new
		broken_bike.break!
		group_of_bikes=[working_bike,broken_bike]
		holder.load_bikes(group_of_bikes)
		holder.release_bikes(group_of_bikes)
		expect(holder.bikes).to eq []
	end

end