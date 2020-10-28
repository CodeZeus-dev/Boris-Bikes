require 'docking_station'

describe DockingStation do

  describe "#release_bike" do

    it { is_expected.to respond_to(:release_bike) }

  end

  describe "#gets_bike" do
    subject { :release_bike }
    it { is_expected.not_to eq nil }
  end

  describe "#working?" do
    it "responds to the working? method of the Bike class" do
      expect(subject.release_bike).to respond_to(:working?)
    end
  end
end
