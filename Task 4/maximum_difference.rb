#!usr/bin/env ruby



# Left and right sequence do NOT have to have the same sequence length!
def maximum_difference_2(v)

  integral_sum = [0]
  max = 0
  for index in (0..v.length-1) do
    integral_sum.push(integral_sum[index] + v[index])
  end

  for seq_len_left in (1..v.length-1) do
    for left_side in (0..(v.length-seq_len_left-1)) do
      sum_l = integral_sum[seq_len_left+left_side] - integral_sum[left_side]
      sum_l_abs = sum_l.abs
      for seq_len_right in (1..(v.length-seq_len_left)) do
        for right_side in (left_side+seq_len_left..(v.length-seq_len_right)) do
          sum_r = integral_sum[right_side + seq_len_right] - integral_sum[right_side]
          sum_r_abs = sum_r.abs
          dif = sum_l_abs + sum_r_abs
          if dif > max
            max = dif
          end
        end
      end
    end
  end
  puts "#{max}"
end

# Sequences have the same size (left and right)
def maximum_difference(v)

  integral_sum = [0]
  max = 0
  for index in (0..v.length-1) do
        integral_sum.push(integral_sum[index] + v[index])
  end

  for seq_len in (1..v.length-1) do
    for left_side in (0..(v.length-seq_len-1)) do
      sum_l = integral_sum[seq_len+left_side] - integral_sum[left_side]
      sum_l_abs = sum_l.abs
      for right_side in (left_side+seq_len..(v.length-seq_len)) do
        sum_r = integral_sum[right_side + seq_len] - integral_sum[right_side]
        sum_r_abs = sum_r.abs
        dif = sum_l_abs + sum_r_abs
        if dif > max
          max = dif
        end
      end
    end
  end
  puts "#{max}"
end

v = [3, -5, 1, -2, 8, -2, 3, -2, 1]
v2 = [ 7,-6,-2,-9,-9,5,0,0,-8,4]
maximum_difference(v2)
maximum_difference_2(v2)