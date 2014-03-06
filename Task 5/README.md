Challenge 5: Order Task
==============
You are given a set of tasks which are uniquely identified by integer IDs and a set of dependencies that define which tasks must be executed prior to others.
Your task is to write a function that orders the tasks so that all dependencies are satisfied
print to the standard output (stdout) all ordered task IDs separated by a white space (on a single line)

Note that your function will receive the following arguments:
- *dependencyFirst* which is an array of integers giving the ID of the task that needs to be executed first in each dependency
- *dependencySecond* which is an array of integers giving the ID of the task that needs to be executed second in each dependency
- *totalNumTasks* which is an integer value giving the total number of tasks in the set

The ith dependency is described as follows: the ith task in dependencyFirst must be executed prior to the ith task in dependencySecond.

Data constraints
--------------
- the number of tasks in each collection will not be higher than 10,000
- within a collection of N tasks all the IDs are integers in the [1,N] range
- for a given set of tasks there may be multiple ways of ordering it to satisfy the dependencies and any of them is accepted as a correct solution

Efficiency constraints
--------------
your function is expected to print the result in less than 2 seconds

Example
--------------

    Input
    dependencyFirst: 3, 1, 2
    dependencySecond: 2, 2, 4
    num_total_tasks: 6
    Output
    3 1 5 2 4 6

Explanation
--------------
The set contains 6 tasks and they will be identified by IDs=1,2,3,4,5,6
Task 3 must be executed prior to task 2, task 1 must be executed prior to task 2 and task 2 must be executed prior to task 4
One order that satisfies the three dependencies is: 3, 1, 5, 2, 4, 6