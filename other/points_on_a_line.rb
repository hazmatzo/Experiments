
# bool collinear(float[][] points)

# returns true if all the points in the array lie on the same line

def is_collinear(params)
  if params.length == ( 1 | 0 )
    return false
  elsif params.length == 2
    return true
  elsif is_horizontal_line(params)
    return true
  elsif is_vertical_line(params)
    return true
  elsif is_diagonal_line(params)
    return true
  else
    return false        
  end      
end

# all y's the same
def is_horizontal_line(params)
  is_horizontal = true
  first_y = params.first.last
  params.each do |n1, n2|
    if first_y != n2
      is_horizontal = false
    end
  end

  is_horizontal 
end

# all x's the same
def is_vertical_line(params)
  is_vertical = true
  first_x = params.first.first
  params.each do |n1, n2|
    if first_x != n2
      is_vertical = false
    end
  end

  is_vertical
end

# y = mx + b
def is_diagonal_line(params)
  is_diagonal = true
  
  n = params.length - 3
  (0..(n)).each do |n|
    if !(slope(params[n], params[n+1]) == slope(params[n+1], params[n+2]))
      is_diagonal = false
    end
  end

  is_diagonal
end

# # b = y - mx
# def y_intercept(a, b)
#   a[1] - (slope(a, b) * a[0])
# end

# m = slope = (y2 - y1) / (x2 - x1)
def slope(a, b)
  (a[1] - b[1]).to_f / (a[0] - b[0]).to_f
end


first_test = is_collinear([[1,2], [2,1]])  # => true
puts "is_collinear([[1,2], [2,1]]) #{first_test}"

second_test = is_collinear([ [1,2], [2,3], [3,4], [4,5] ])
puts "is_collinear([ [1,2], [2,3], [3,4], [4,5] ]) #{second_test}" # => true

third_test = is_collinear([[1,2], [2,1], [4,0]])
puts "is_collinear([[1,2], [2,1], [4,0]]]) #{third_test}" # => false