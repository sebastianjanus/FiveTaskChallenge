Challenge 3: Road map
===

You are living in a country with N cities. Each city is identified by an unique integer ID in the [1..N] range. 
The cities are connected by M bidirectional roads. All the roads have the same length. Given the ID of your home 
city and the ID of a destination city Your task is to write a function that prints to the standard output (stdout) 
the minimum number of roads you need to travel in order to reach the destination city. the destination city will always be accessible from your home city.
Note that your function will receive the following arguments:

- *N* which is an integer number giving the number of cities
- *home_city* which is an integer number giving the ID of your home city
- *dest_city* which is an integer number giving the ID of the destination city
- *firstCityRoads* which is an array of integers giving the ID of the first city connected by each road
- *secondCityRoads* which is an array of integers giving the ID of the second city connected by each road

The ith road connects the ith city in the firstCityRoad array and the ith city in the secondCityRoad array.

Data constraints
--------------
- the number of cities will not exceed 5000
- the number of roads will not exceed 100000

Efficiency constraints
--------------
your function is expected to print the result in less than 2 seconds

Example
--------------

    Input
    N: 7
    home_city: 1
    dest_city: 4
    firstCityRoads: [1, 2, 3, 2, 5]
    secondCityRoads: [3, 3, 4, 4, 6]
    Output 2
