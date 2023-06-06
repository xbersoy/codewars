# Scheduling is how the processor decides which tasks(processes) get to use the processor and for how long.
# The tasks are taken from a task pool based on a specific rule.
# One such rule is the Shortest Task First. Under this rule, the next task to execute is the one with shortest
# execution time. If there are multiple tasks with same vcles, the rule is to execute the task with the lower
# index first.
# In this problem, you will be given a task pool including the execution times (the number of CPU cycles ) for each
# task. Then, you will write a function to determine which task is in execution during a given cycle.
# The task pool will be given as an array of integers. The tasks are identified by their index in this array (zero
# based). And the values in the array represent the number of CPU cycles required to execute that task. Your
# mission is to find the index of the task that is running at a given cycle.
# Let's go over an example scenario
# Consider the following task pool, and an example process of finding the task which executes during the given
# CPU cycle.
# Tasks array : [3, 4, 3, 2, 5]
# CPU Cycle : 10
# • According to the Shortest Task First rule, Task 3 (task given at index 3 of the array) has the lowest cycle
# time of 2, so it will be executed first.
# • Then, Tasks 0 and 2 have the next lowest cycle of 3. Task 0 will be executed first due to the lower index
# rule. And Task 2 will follow next.
# Accordingly at CPU cycle 8 (2+3+3), Task 3, Task 0 and Task 2 will be completed. (see the image below)
# • Next task will be Task1 with CPU cycle time 4. That means Task 1 will be running from cycle 9 until cycle
# 12. So we see that Task 1 is executing at cycle 10. Accordingly our function should return 1 as the
# response. (see below)

#                                                                   |
#                                                                   |
#                                                                   |
#                                                                   v
# cycle1 cycle2 cycle3 cycle4 cycle5 cycle6 cycle7 cycle8 cycle9 cycle10 cycle11 cycle12 cycle13 cycle14 cycle15 cycle16 cycle17
#  task3  task3 task0  task0  task0  task2  task2   task2  task1  task1   task1   task1   task4   task4   task4   task4   task4

# Returns the index of the task in execution for a given cycle.

# Parameters

# tasks: Array (of Integers) - A non-empty array of positive integers representing
# execution time in cycles needed to finish a task.

# cycle: Integer - A number representing the cycle during which we want to find the task in
# execution

# Return Value

# Integer - The index of task in execution during the given cycle

# Examples
# tasks               cycle   Return Value
# [3,10,20,1,21]       15          1
# [3,10,10,20,1,21]    130         3

# to be optimized
def get_task_index_at_cycle(tasks, cycle)
  task_length_and_occurences = Hash.new(0)
  true_task_length = 0

  tasks.sort.reduce do |sum, n|
    task_length_and_occurences[n] += 1

    if cycle.between?(sum, sum + n)
      true_task_length = n
      break
    end
    sum += n
  end

  get_nth_index(tasks, true_task_length, task_length_and_occurences[true_task_length])
end

def get_nth_index(array, element, occurence_count)
  array.each_with_index do |n, i|
    if element == n
      if occurence_count == 1
        return i
      end
      occurence_count -= 1
    end
  end
end

get_task_index_at_cycle([3, 4, 3, 2, 5], 10)


# def old_method(jobs, cycle)
#   index_in_sorted_array = 0
#   completed_cycles = 0
#   task_length = 0
#   task_length_occurence = Hash.new { |h, k| h[k] = 0 }

#   jobs.sort.each_with_index do |n, i|
#     task_length_occurence[n] += 1

#     if cycle.between?(completed_cycles, completed_cycles + n)
#       index_in_sorted_array = i
#       task_length = n
#       break
#     end

#     completed_cycles += n
#   end

#   jobs.each_with_index.select do |n, i|
#     if n == task_length && task_length_occurence[n] == 1
#       p i # return i
#     else
#       task_length_occurence[n] -= 1
#     end
#   end
# end

# old_method([3, 4, 3, 2, 5], 10)
# old_method([3,10,20,1,21], 15)
# old_method([3,10,10,20,1,21], 130)
