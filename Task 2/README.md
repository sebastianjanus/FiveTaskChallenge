Challenge 2: Hill
==============
Given an array of integer elements your task is to write a function that finds the minimum value X that makes possible the following: generate a new array that is sorted in strictly ascending order by increasing or decreasing each of the elements of the initial array with integer values in the [0, X] range.
Example: Having the initial array [5, 4, 3, 2, 8] the minimum value for X is 3. Decrease the first element (5) by 3, decrease the second one (4) by 1, increase the third one (3) by 1, increase the forth one (2) by 3 and do nothing to the last one (8). In the end we obtain the array [2, 3, 4, 5, 8] which is sorted in strictly ascending order.
print the result X to the standard output (stdout)
Note that your function will receive the following arguments:
- *v* which is the array of integers

Data constraints
--------------
- numbers are in ascending order when arranged from the smallest to the largest number
- strictly ascending order means that each element is greater than the preceding one (e.g. [1, 2, 2, 3] is NOT strictly ascending order)
- the length of the array will not exceed 5000
- the elements of any of the arrays are integer numbers in the [1, 231 -1] range

Efficiency constraints
--------------
your function is expected to print the result in less than 2 seconds

Example
--------------
	Input
	v: 5, 4, 3, 2, 8
	Output
	3
