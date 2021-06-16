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
  trains.each_with_object(Hash.new(0)) do |train, hash|
    train.cargo.keys.each { |car| hash[car] += train.count_cars(car) }
  end
end
  # MY SOLUTION BELOW. REFACTOR FROM SCOTT ABOVE
  # def total_inventory
  #   result = Hash.new(0)
  #   @trains.each do |train|
  #     train.cargo.each do |cargo, quant|
  #       result[cargo] += quant
  #     end
  #   end
  #   result
  # end
  #

  def trains_containing(car)
    @trains.find_all do |train|
      train.cargo.keys.include?(car)
    end
  end

  def overflow_cars
    cars = []
      total_inventory.find_all do |car, quantity|
        if (quantity > 10) && (trains_containing(car).length > 1)
          cars << car
        end
      end
    cars
  end
end
