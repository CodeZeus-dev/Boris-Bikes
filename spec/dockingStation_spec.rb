require 'docking_station'
require 'bike'

describe DockingStation do

  it 'you can set the default_capacity' do
    expect(DockingStation.new(5).capacity).not_to eq(20)
  end

  it 'when you dont set it, its still 20' do
    expect(DockingStation.new.capacity).to eq(20)
  end


  describe "release_bike" do
    it { is_expected.to respond_to(:release_bike) }

    it "releases a bike" do
      subject.dock double(:bike)
      bike = subject.release_bike
      expect(bike).to be_instance_of(Bike)
    end

    it "raises an Exception" do
      expect { subject.release_bike }.to raise_error(Exception)
    end
  end

  describe "working?" do
    it "responds to the working? method of the Bike class" do
      subject.dock double(:bike)
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

  describe 'report' do
    it "responds to report" do
      expect(subject).to respond_to(:report)
    end

    it "moves the docked bike from the bikes array to the broken bikes array" do
      subject.dock double(:bike)
      subject.report
      expect(subject.broken_bikes[-1]).to be_instance_of(Bike)
    end

    it "decrements capacity by one" do
      subject.dock double(:bike)
      capacity_before = subject.capacity
      subject.report
      expect(subject.capacity).to eq(capacity_before - 1)
    end
  end

end
