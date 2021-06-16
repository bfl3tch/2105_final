class TrainYard
  attr_reader :location, :trains

  def initialize(info)
    @location = info[:location]
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def types_of_trains
    @trains.map do |train|
      train.type
    end.sort.uniq
  end

  def trains_containing(car)
    @trains.find_all do |train|
      train.cargo.include?(car)
    end
  end

  def sorted_cargo_list
    sorted_list = []
    @trains.each do |train|
      train.cargo.keys.each do |car|
        sorted_list << car.type
      end
    end
    sorted_list.uniq.sort
  end

  def total_inventory
    result = Hash.new(0)
    @trains.each do |train|
      train.cargo.each do |cargo, quant|
        result[cargo] += quant
      end
    end
    result
  end
  
  # end
  #   result = Hash.new(0)
  #   @trains.each do |train|
  #     train.cargo.keys.each do |cargo|
  #       train.cargo.values.sum
  #       # require "pry"; binding.pry
  #       # sum_up = train.cargo.values
  #       # result[cargo] = sum_up.sum
  #       #
  #       # result = { cargo =>
  #       #
  #       # }
  #
  #       # require "pry"; binding.pry
  #
  #       #cargo is array, first value is car, second is quant
  #
  #
  #   # #new hash, keys are cars
  #   # #values are the quantity of the specific cars
  #   # @trains.each do |train|
  #   #   train.cargo.each do |cargo|
  #   #     cargo.each do |car|
  #   #   require "pry"; binding.pry
  #         # result[car] = 0
  #         # sum << cargo.last
  #         #key is set as the car, need to
          #iterate through cars that match and
          #pull out values, sum them


        # end
    #   end
    # end
  #   result
  # end

  # def overflow_cars
  #   total_inventory.find_all do |car, quantity|
  #     @trains.include?(car) == false
  #   end
  # end

end
