require 'pry'

class Triangle
  
  attr_accessor :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    condition1 = @side1 > 0 && @side2 > 0 && @side3 > 0
    condition2 = @side1 + @side2 > @side3 && @side1 + @side3 > @side2 && @side2 + @side3 > @side1

    if condition1 && condition2
      if [@side1, @side2, @side3].uniq.count == 2
        :isosceles
      elsif [@side1, @side2, @side3].uniq.count == 1
        :equilateral
      else
        :scalene
      end
    else
      raise TriangleError
    end
  end

  class TriangleError < StandardError
  end

end

t1 = Triangle.new(3, 3, 3)
t2 = Triangle.new(3, 3, 4)
t3 = Triangle.new(3, 4, 5)

binding.pry