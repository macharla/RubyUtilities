# Find smallest unavailable number in a array
def solution(a)
  max = a.max
  
  min = a.min
  
  out =nil
  
  b = a.uniq.sort
  b.each_with_index do |x, i|
    if (x+1 != b[i+1])
      return x+1 
    end
  end
  return max+1
end
puts solution(a)


