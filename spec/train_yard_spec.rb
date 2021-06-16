require 'rspec'
require './lib/car'
require './lib/train'
require './lib/train_yard'

RSpec.describe TrainYard do
  describe 'instantiation' do
    it 'creates a new train' do
      train_yard = TrainYard.new({location: 'Brighton'})

      expect(train_yard).to be_an_instance_of(TrainYard)
    end

    it 'has readable attributes' do
      train_yard = TrainYard.new({location: 'Brighton'})

      expect(train_yard.location).to eq('Brighton')
      expect(train_yard.trains).to eq([])
    end
  end

  describe 'it has a method that' do
    it 'can add trains to the trainyard' do
      train_yard = TrainYard.new({location: 'Brighton'})
      car1 = Car.new({type: 'Mail', weight: 5})
      car2 = Car.new({type: 'Passengers', weight: 1})
      car3 = Car.new({type: 'Cattle', weight: 3})
      car4 = Car.new({type: 'Dining', weight: 4})
      train1 = Train.new({name: 'Thomas', type: 'Tank'})
      train2 = Train.new({name: 'Emily', type: 'Tender'})
      train3 = Train.new({name: 'Nia', type: 'Tank'})
      train4 = Train.new({name: 'Gordon', type: 'Express'})
      train1.add_cars(car1, 5)
      train1.add_cars(car2, 2)
      train2.add_cars(car1, 3)
      train2.add_cars(car4, 4)
      train3.add_cars(car1, 1)
      train4.add_cars(car4, 5)
      train4.add_cars(car3, 10)
      expect(train_yard.trains).to eq([])

      train_yard.add_train(train1)
      train_yard.add_train(train2)
      train_yard.add_train(train3)
      train_yard.add_train(train4)
      expected = [train1, train2, train3, train4]

      expect(train_yard.trains).to eq(expected)
    end
  end
end
