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

    it 'can list the types of trains in the trainyard' do
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
      expected = ['Express', 'Tank', 'Tender']

      expect(train_yard.types_of_trains).to eq(expected)
    end

    it 'can show the trains containing a specific car' do
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
      expected = [train1, train2, train3]

      expect(train_yard.trains_containing(car1)).to eq(expected)
      expect(train_yard.trains_containing(car2)).to eq([train1])
    end

    it 'can create a sorted cargo list' do
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
      train2.add_cars(car1, 3)
      train2.add_cars(car4, 4)
      train3.add_cars(car1, 4)
      train4.add_cars(car4, 5)
      train4.add_cars(car3, 10)
      train_yard.add_train(train1)
      train_yard.add_train(train2)
      train_yard.add_train(train3)
      train_yard.add_train(train4)
      expected = ['Cattle', 'Dining', 'Mail']

      expect(train_yard.sorted_cargo_list).to eq(expected)
    end

    it 'can list the total inventory' do
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
      train2.add_cars(car1, 3)
      train2.add_cars(car4, 4)
      train3.add_cars(car1, 4)
      train4.add_cars(car4, 5)
      train4.add_cars(car3, 10)
      train_yard.add_train(train1)
      train_yard.add_train(train2)
      train_yard.add_train(train3)
      train_yard.add_train(train4)
      expected = {  car1 => 12,
                    car3 => 10,
                    car4 => 9
                  }

      expect(train_yard.total_inventory).to eq(expected)
    end

    it 'display all trains containing a car' do
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
      train2.add_cars(car1, 3)
      train2.add_cars(car4, 4)
      train3.add_cars(car1, 4)
      train4.add_cars(car4, 5)
      train4.add_cars(car3, 10)
      train_yard.add_train(train1)
      train_yard.add_train(train2)
      train_yard.add_train(train3)
      train_yard.add_train(train4)

      expect(train_yard.trains_containing(car1)).to eq([train1, train2, train3])
    end

    it 'can show all overflow cars' do
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
      train2.add_cars(car1, 3)
      train2.add_cars(car4, 4)
      train3.add_cars(car1, 4)
      train4.add_cars(car4, 5)
      train4.add_cars(car3, 10)
      train_yard.add_train(train1)
      train_yard.add_train(train2)
      train_yard.add_train(train3)
      train_yard.add_train(train4)

      expect(train_yard.overflow_cars).to eq([car1])
    end
  end
end
