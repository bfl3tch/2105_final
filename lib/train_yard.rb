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
end
