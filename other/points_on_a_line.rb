
# bool collinear(float[][] points)

# returns true if all the points in the array lie on the same line

# collinear([[1,2], [2,1]]) => true

# collinear([ [1,2], [2,3], [3,4], [4,5] ]) => true

# collinear([[1,2], [2,1], [4,0]]]) => false

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
def is_horizontal(params)
    is_horizontal = true
    first_y = params.first.last
    params.each do |n1, n2|
        if first_y != n2
            is_horizontal = false
        end
    end 
end

# all x's the same
def is_vertical(params)
  is_vertical = true
  first_x = params.first.first
  params.each do |n1, n2|
    if first_x != n2
      is_vertical = false
    end
  end
end

# y = mx + b
# m = slope = (y2 - y1) / (x2 - x1)
# b = y-intercept

# a, b, c
# ab bc



def is_diagonal_line(params)
   still_a_line = true
   # params.each_slice(2) { |a,b| p [a, b] }
   
   params.each_slice(3) do |n1, n2, n3|
      if !still_a_line
          return false
      else
          if !(y_intercept(n1, n2) == y_intercept(n2, n3)) && (slope(n1, n2) == slope(n2, n3))
              still_a_line = false
          end
      end
   end
   still_a_line
end

def y_intercept(a, b)
    
end

def slope(a, b)

end