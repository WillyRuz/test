class Car
  attr_accessor :brand, :color, :year
  @on = 0
  @off = 0

  def turn_on
    puts 'The engine has been started'
    @on = 1
  end

  def start_travel
    raise StandardError, 'You have to start the engine first' if @on != 1

    puts 'Travel has started'
    @off = 1
  end

  def end_travel
    raise StandardError, 'You have to start the travel first' if @off != 1

    puts 'Travel has ended'
  end
end

travel = Car.new
travel.turn_on
travel.start_travel
travel.end_travel