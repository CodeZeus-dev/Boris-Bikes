class DockingStation

  attr_reader :bike

  def release_bike
    raise Exception.new "Sorry, there are no bikes available." if @bike == nil
    Bike.new if @bike != nil
  end

  def dock_bike(bike)
    @bike = bike
  end

  def see_docked_bike
    puts @bike
  end

end
