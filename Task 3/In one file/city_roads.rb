#!/usr/bin/env ruby

class Edge

  attr_reader :start_id,:end_id

  def initialize(start_id,end_id)
    @start_id=start_id
    @end_id=end_id
  end
end
class Map

  attr_accessor :nodes

  def initialize
    @nodes = Array.new()
  end
end
class Node

  attr_accessor :count,:prev,:count, :edges
  attr_reader :id

  def initialize(id)
    @id = id
    @prev = 0
    @edges = Array.new()
    @count =0
  end

  def has_next_edge
    if @count < @edges.length
      1
    else
      0
    end
  end

  def get_next_edge
    tmp=@edges[@count]
    @count = @count + 1
    tmp
  end
end

def gen_nodes (cities, country)

  for i in (1..cities) do
    country.nodes.push(Node.new(i))
  end

end

def gen_edges(city_first, city_second, country)
  for i in (0..city_first.length-1) do
    country.nodes[city_first[i]-1].edges.push(Edge.new(city_first[i],city_second[i]))
    country.nodes[city_second[i]-1].edges.push(Edge.new(city_second[i],city_first[i]))
  end
end

def shortest_way(start_id, end_id, country)
  tmp = start_id
  goal = end_id
  stack = Array.new()
  stack.push(tmp)
  way = 999
  way_short = 999
  count_way =0

  while stack.length != 0

    while country.nodes[tmp-1].has_next_edge == 1
      edge = country.nodes[tmp-1].get_next_edge
      unless stack.include? edge.end_id
        if stack.length >= way_short
          #DO NOTHING
        else
          tmp = country.nodes[edge.end_id-1].id
          stack.push(tmp)
          country.nodes[tmp-1].prev=edge.start_id
          #ROUTE FOUND
          if tmp == goal
            country.nodes[country.nodes[tmp-1].prev-1].count=0
            tmp = country.nodes[country.nodes[tmp-1].prev-1].prev
            way = stack.length-1
            if $DEBUG
              print "Route found: "
              stack.each do |st|
                print "#{st} "
              end
            end
            count_way = count_way + 1
            if $DEBUG
              puts "(#{way} roads)"
            end
            stack.pop
            stack.pop

            if way < way_short
              way_short = way
            end
          end
        end
      end
    end

    country.nodes[tmp-1].count=0
    tmp = country.nodes[tmp-1].prev
    stack.pop
  end
  if $DEBUG
    puts " "
  end
  if count_way > 0
    if $DEBUG
      puts "Shortest way is #{way_short} roads long. (Found: #{count_way})"
    end
    puts way_short
  else
    if $DEBUG
      puts "No routes exist."
    end
    puts 0
  end
end

def city_roads(n, home_city, dest_city, firstCityRoads,secondCityRoads)

  country = Map.new()
  gen_nodes(n, country)
  gen_edges(firstCityRoads,secondCityRoads, country)
  shortest_way(home_city, dest_city, country)

end

if __FILE__ == $0
city_first= [1, 2, 3, 2, 5]
city_second=[3, 3, 4, 4, 6]
arr = Array.new
=begin extended testing
File.foreach('world_map').map { |line| arr<<line.split(" ")}
cities_t = arr[0].map {|x| x.to_i}
cities= cities_t[0]
city_first=arr[1].map {|x| x.to_i}
city_second=arr[2].map {|x| x.to_i}

=end

home = 1
dest = 4
n = 7

city_roads(n,home,dest,city_first,city_second)

end