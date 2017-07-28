class Triangle
  # write code here

  attr_accessor :side_one, :side_two, :side_three

  def initialize(side_one, side_two, side_three)
    @side_one = side_one
    @side_two = side_two
    @side_three = side_three
  end

  def positive?
    if @side_one > 0 && @side_two > 0 && @side_three > 0
      return true
    else
      return false
    end
  end


  def equality?
    test_one = @side_one + @side_two > @side_three
    test_two = @side_one + @side_three > @side_two
    test_three = @side_two + @side_three > @side_one

    if test_one && test_two && test_three
      return true
    else
      return false
    end
  end


  def triangle_type
    one_two = @side_one == @side_two
    one_three = @side_one == @side_three
    two_three = @side_two == @side_three

    if one_two && one_three && two_three
      return :equilateral
    elsif one_two || one_three || two_three
      return :isosceles
    elsif !one_two && !one_three && !two_three
      return :scalene
    end
  end


  def kind
    if !self.positive? || !self.equality?
      begin
        raise TriangleError
      # rescue TriangleError => error
      #   error.message
      end
    else
      self.triangle_type
    end
  end


end


class TriangleError < StandardError
  def message
    puts 'your triangle sucks, bruh'
  end
end
