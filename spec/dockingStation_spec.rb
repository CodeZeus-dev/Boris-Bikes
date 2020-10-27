require 'docking_station'

describe DockingStation do
  docking_station = described_class.new

  describe "#release" do
    it "releases a bike" do
      expect(docking_station.release_bike).to eq "Bike released"
    end
  end

end
