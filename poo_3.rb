class Car
  attr_accessor :brand, :color, :year
  @on = 0
  @off = 0

  def self.turn_on
    puts 'The engine has been started'
    @on = 1
  end

  def self.start_travel
    raise StandardError, 'You have to start the engine first' unless @on == 1

    puts 'Travel has started'
    @off = 1
  end

  def self.end_travel
    raise StandardError, 'You have to start the travel first' unless @off == 1

    puts 'Travel has ended'
  end
end


Car.turn_on
Car.start_travel
Car.end_travel