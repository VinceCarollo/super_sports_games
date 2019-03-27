class Event
  attr_reader :name, :ages

  def initialize(name, ages)
    @name = name
    @ages = ages
  end

  def min_age
    ages.min_by{|age| age}
  end

  def max_age
    ages.max_by{|age| age}
  end

  def average_age
    (ages.sum / ages.length.to_f).round(2)
  end

  def standard_deviation_age
    subtract_each = @ages.map{|age| age - average_age}
    square_each = subtract_each.map{|age| (age * age).round(2)}
    Math.sqrt(square_each.sum / square_each.length).round(2)
  end

end
