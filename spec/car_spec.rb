require 'rspec'
require './lib/car'

RSpec.describe Car do
  describe 'instantiation' do
    it 'creates a new car' do
      car1 = Car.new({type: 'Mail', weight: 5})
      car2 = Car.new({type: 'Passengers', weight: 1})

      expect(car1).to be_an_instance_of(Car)
      expect(car2).to be_an_instance_of(Car)
    end

    it 'has readable attributes' do
      car1 = Car.new({type: 'Mail', weight: 5})
      car2 = Car.new({type: 'Passengers', weight: 1})

      expect(car1.type).to eq('Mail')
      expect(car2.type).to eq('Passengers')
      expect(car1.weight).to eq(5)
    end
  end
end
