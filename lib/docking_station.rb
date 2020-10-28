class DockingStation

  attr_reader :bike

  def release_bike
    Bike.new
  end

  def dock_bike(bike)
    @bike = bike
  end

  def see_docked_bike
    puts @bike
  end

end
