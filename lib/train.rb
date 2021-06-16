class Train
  attr_reader :name, :type, :cargo

  def initialize(info)
    @name = info[:name]
    @type = info[:type]
    @cargo = Hash.new(0)
  end

  def count_cars(car)
    @cargo[car]
  end

  def add_cars(car, num)
    @cargo[car] += num
  end

  def weight
    @cargo.sum do |car, quantity|
      (car.weight * quantity)
    end
  end
end
