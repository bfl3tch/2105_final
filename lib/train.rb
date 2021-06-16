class Train
  attr_reader :name, :type, :cargo
  
  def initialize(info)
    @name = info[:name]
    @type = info[:type]
    @cargo = Hash.new
  end
end
