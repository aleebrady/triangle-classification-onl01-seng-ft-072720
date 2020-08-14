class Triangle
  attr_accessor :sides
  
  def initialize( side_1, side_2, side_3 ) # init sides of a triangle
    @sides = [ side_1, side_2, side_3 ] # put sides in array 
  end
  
  def kind 
    valid_triangle? 
# define the 3 types of triangles through this method 
    unique_sides = @sides.uniq.length # find uniq length in sides array
    case unique_sides #create a case for unique_sides to be used by when 
      when 1 
        kind = :equilateral # create condition
      when 2
        kind = :isosceles #create condition
      else 3
        kind = :scalene # create condition
    end
    return kind # returns kind of triangle
  end
  
  def valid_triangle? # will validate triangle
    a, b, c = @sides # variable to @sides array
    triangle = [(a + b > c), (a + c > b), (b + c > a)] # checks dimensions of triangle 
    triangle << !@sides.any? { |side| side <= 0 } # validates each side must be larger than 0
    raise TriangleError if triangle.include?(false) # one or more sides are not > 0, will raise error
  end
  
  class TriangleError < StandardError # TriangleError class inherits from StandardError class
    def message 
      "Triangle Error: The dimensions do not equal a triangle"
    end
  end
end