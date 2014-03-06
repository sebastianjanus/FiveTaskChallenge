#!/usr/bin/env ruby

def find_deviation(v,v_length,d)

  dev  = 0
  j    = 0

  # min = 2^(31)-1
  max  = 0
  min  = 2147483647
  if d == 0 or d == 1
  elsif d==v_length
    v.each { |element|
      max = element if element > max
      min = element if element < min
    }
    dev = max-min
  else
    index = 0
    index2 = 0
    while index <= v_length
      if j<=d-1
        j+=1
        max = v[index] if v[index] > max
        min = v[index] if v[index] < min
      elsif j==d
        unless index == v_length
          index = index - d
        end
          j = 0
          if dev < (max-min)
            dev = max-min
          end
          max  = 0
          min  = 2147483647
      end
      index += 1
      index2 +=1
    end
  end
  puts dev
end

v=[6, 9, 4, 7, 4, 1]
d=3


find_deviation(v,v.length,d)