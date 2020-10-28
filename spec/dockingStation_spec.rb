require 'docking_station'

describe DockingStation do

  describe "#release_bike" do

    it { is_expected.to respond_to(:release_bike) }

  end

  describe "gets_a_bike" do
    subject { :release_bike }
    it { is_expected.not_to eq nil }
  end

  describe "#working?" do
    it "responds to the working? method of the Bike class" do
      expect(subject.release_bike).to respond_to(:working?)
    end
  end

  describe "#dock_bike" do
    it "docks the bike at the docking station" do
      expect(subject).to respond_to(:dock_bike)
    end
  end

  describe "#see_docked_bike" do
    it "enables the user to see the docked bike" do
      expect(subject).to respond_to(:see_docked_bike)
    end
  end

end
