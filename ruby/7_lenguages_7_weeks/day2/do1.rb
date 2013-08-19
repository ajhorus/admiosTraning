# 1 Print the contents of an array of sixteen numbers, four numbers at a
# time, using just each. Now, do the same with each_slice in Enumerable.

arr = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]

arr.each {|x| print x[0,4] }