class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise Exception.new "Sorry, there are no bikes available." if @bikes.empty?
    @bikes.pop if !@bikes.empty?
  end

  def dock(bike)
    raise Exception.new "Sorry, the docking station is in full capacity." if @bikes.length == 20
    @bikes << bike if @bikes.length < 20
  end

  def see_docked_bike
    @bikes.each { |bike|
      puts bike
    }
  end

end
