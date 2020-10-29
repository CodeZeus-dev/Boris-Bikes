require 'docking_station'
require 'bike'

describe DockingStation do

  describe "#release_bike" do
    it { is_expected.to respond_to(:release_bike) }

    it "releases a bike" do
      docking_station = DockingStation.new
      docking_station.dock(Bike.new)
      bike = docking_station.release_bike
      expect(bike).to be_instance_of(Bike)
    end

    it "raises an Exception" do
      expect { subject.release_bike }.to raise_error(Exception)
    end
  end

  describe "#working?" do
    it "responds to the working? method of the Bike class" do
      docking_station = DockingStation.new
      docking_station.dock(Bike.new)
      bike = docking_station.release_bike
      expect(bike).to respond_to(:working?)
    end
  end

  describe "#dock" do
    it "docks the bike at the docking station" do
      expect(subject).to respond_to(:dock)
    end

    it "raises an Exception" do
      expect { subject.dock() }.to raise_error(Exception)
    end
  end

  describe "#see_docked_bike" do
    it "enables the user to see the docked bike" do
      expect(subject).to respond_to(:see_docked_bike)
    end
  end

end
