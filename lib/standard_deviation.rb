ages = [24, 30, 18, 20, 41]


avg = ages.sum / ages.length.to_f
subtract_each = ages.map{|num| (num - avg).round(2) }
square_each = subtract_each.map{|num| (num * num).round(2) }
standard_deviation =  (Math.sqrt(square_each.sum / ages.length)).round(2)
p standard_deviation
