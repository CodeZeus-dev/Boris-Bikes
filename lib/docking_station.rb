class DockingStation

  $DEFAULT_CAPACITY = 20

  attr_reader :bikes

  def initialize(capacity = $DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def default_reader
    @capacity
  end

  def release_bike
      raise Exception.new "Sorry, there are no bikes available." if empty_station?
      @bikes.pop
  end

  def dock(bike)
    raise Exception.new "Sorry, the docking station is in full capacity." if full?
    @bikes << bike
  end

  def see_docked_bike
    @bikes.each { |bike|
      puts bike
    }
  end

  private

  def empty_station?
    return true if @bikes.length == 0
    return false
  end

  def full?
    return true if @bikes.length == $DEFAULT_CAPACITY
    return false
  end

end
