class DockingStation

  $DEFAULT_CAPACITY = 20

  attr_reader :bikes, :broken_bikes, :capacity

  def initialize(capacity = $DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def release_bike
      raise Exception.new "Sorry, there are no bikes available." if @bikes.empty?
      @bikes.pop
  end

  def dock(bike)
    raise Exception.new "Sorry, the docking station is in full capacity." if full?
    @bikes << bike
  end

  def report
    @broken_bikes << @bikes.pop
    @capacity -= 1
  end

  private

  def full?
    return true if @bikes.length == @capacity
    return false
  end

end
