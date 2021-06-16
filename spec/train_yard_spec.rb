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
end
