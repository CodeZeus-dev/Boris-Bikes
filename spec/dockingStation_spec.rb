require 'docking_station'
require 'bike'

describe DockingStation do

  it 'you can set the default_capacity' do
    expect(DockingStation.new(5).default_reader).not_to eq(20)
  end

  it 'when you dont set it, its still 20' do
    expect(DockingStation.new.default_reader).to eq(20)
  end


  describe "release_bike" do
    it { is_expected.to respond_to(:release_bike) }

    it "releases a bike" do
      subject.dock(Bike.new)
      bike = subject.release_bike
      expect(bike).to be_instance_of(Bike)
    end

    it "raises an Exception" do
      expect { subject.release_bike }.to raise_error(Exception)
    end
  end

  describe "working?" do
    it "responds to the working? method of the Bike class" do
      subject.dock(Bike.new)
      bike = subject.release_bike
      expect(bike).to respond_to(:working?)
    end
  end

  describe "dock" do
    it "docks the bike at the docking station" do
      expect(subject).to respond_to(:dock)
    end

    it "raises an Exception" do
      expect { subject.dock() }.to raise_error(Exception)
    end
  end

  describe "see_docked_bike" do
    it "enables the user to see the docked bike" do
      expect(subject).to respond_to(:see_docked_bike)
    end
  end

  describe "full?" do
    it 'responds to full?' do
      result = subject.send(:full?)
      expect(result).to eq(false)
    end

    it 'when asked if its full it returns a bool' do
      result = subject.send(:full?)
      expect([true, false]).to include(result)
    end

    it 'returns true when @bikes.length == $DEFAULT_CAPACITY' do
      $DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
      result = subject.send(:full?)
      expect(result).to eq(true)
    end
  end

  describe "empty_station?" do
    it 'responds to empty_station?' do
      result = subject.send(:empty_station?)
      expect(result).to eq(true)
    end

    it 'returns a bool when asked if the station\'s empty' do
      result = subject.send(:empty_station?)
      expect([true, false]).to include(result)
    end
  end

end
