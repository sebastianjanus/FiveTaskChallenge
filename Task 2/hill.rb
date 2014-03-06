#!/usr/bin/env ruby

def hill(v, v_length)

  # In order to achieve a *strictly* ascending order, we have to remove
  # all elements that appear more than once.
  v.uniq!
  v_s=v.sort
  dif_a = Array.new

  # To find *x*, we have to compare the sorted array with the original array and create a
  # third one *dif_a*, which holds the numeric difference between the first two.
  # The maximum in *dif_a* is our minimum *x*.
  v_s.zip(v).each do |v_s, v|
    dif_a.push((v.to_i - v_s.to_i).abs)
  end
  dif_a.sort!.reverse!
  puts dif_a.first
end

v=[5, 4, 3, 2, 8]
hill(v,v.length)