class NycRestaurants::Restaurants
  attr_accessor :name, :rank, :description

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

end
