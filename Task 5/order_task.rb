#!usr/bin/env ruby

class Node
  attr_reader :id
  attr_accessor :exe_bf
  def initialize(id)
    @id = id
    @exe_bf = Array.new()
  end
end

def init_nodes(totalNumTasks)
  i = 1
  allNodes = Array.new
  totalNumTasks.times do
    allNodes<<Node.new(i)
    i+=1
  end
  allNodes
end

#gives back next executable element
def search_breadth(allNodes, index, order)
  index2 = index-1
  order.each do |element|
    if allNodes[index2].exe_bf.include?(element)
      allNodes[index2].exe_bf.delete(element)
    end
  end
    if allNodes[index2].exe_bf.empty?
      return allNodes[index2].id
    else
      search_breadth(allNodes, allNodes[index2].exe_bf.last,order)
    end
end


def order_task(dependencyFirst, dependencySecond, totalNumTasks)

  allNodes=init_nodes(totalNumTasks)
  stack = Array.new()
  dependencyFirst_tmp = dependencyFirst
  (1..totalNumTasks).each do |i|
    stack << i
  end

  order = Array.new()
  for first in (0..dependencyFirst.length-1) do
    allNodes[dependencySecond[first]-1].exe_bf << dependencyFirst[first]
  end

  while !(stack.empty?) do
    #Maybe get this IF out and just use stack.first - its in the weird case, that you want to go through the dependencyFirst things at first ...?!
    if dependencyFirst_tmp.empty?
      new_element = search_breadth(allNodes,stack.first,order)
    else
      new_element = search_breadth(allNodes,dependencyFirst_tmp.first,order)
    end

    order << new_element
    stack.delete(new_element)
    dependencyFirst_tmp.delete(new_element)
  end

  order.each do |element|
    print "#{element} "
  end
  puts " "
end

dependencyFirst = [3,1,2]
dependencySecond = [2,2,4]
totalNumTasks = 6

order_task(dependencyFirst, dependencySecond,totalNumTasks)