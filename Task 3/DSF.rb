require_relative "node.rb"
require_relative "edge.rb"
require_relative "map.rb"

$DEBUG

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

def status_country(country)
  country.nodes.each do |tmp|
   puts "Node #{tmp.id} has #{tmp.edges.length} edges."
  end
end

def dfs(start_id, end_id, country)

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
        tmp = country.nodes[edge.end_id-1].id
        stack.push(tmp)

        country.nodes[tmp-1].prev=edge.start_id
        if tmp == goal
          tmp = country.nodes[tmp-1].prev
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
          if way < way_short
            way_short = way
          end
        end
      end
    end

    country.nodes[tmp-1].count=0
    tmp = country.nodes[tmp-1].prev
    stack.pop
  end
  puts " "
  if count_way > 0
    puts "#{count_way} different routes found. Shortest is #{way_short} roads long."
  else
    puts "No routes exist."
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
  puts " "
  if count_way > 0
    puts "Shortest way is #{way_short} roads long. (Found: #{count_way})"
  else
    puts "No routes exist."
  end
end

def start

  start_id = ARGV[0].to_i
  end_id = ARGV[1].to_i

  country = Map.new()
  #Simple testing variables
=begin
  city_first= [1,2,3,2,5,1,7,7,1]
  city_second=[3,3,4,4,6,7,3,4,4]
  cities=7
=end
  #Advanced testing with world_map file

  arr = Array.new

  File.foreach('world_map').map { |line| arr<<line.split(" ")}
  cities_t = arr[0].map {|x| x.to_i}
  cities= cities_t[0]
  city_first=arr[1].map {|x| x.to_i}
  city_second=arr[2].map {|x| x.to_i}

  #End advanced testing


  gen_nodes(cities, country)
  gen_edges(city_first,city_second, country)
  if $DEBUG
    status_country(country)
    puts " "
  end
  puts "Discover all ways (full DSF) or shortest way (improved efficiency): >ALL or >SHORT"
  print "> "
  if STDIN.gets.chomp.eql? "ALL"
    puts "Searching for routes from #{start_id} to #{end_id}"
    dfs(start_id,end_id,country)
  else
    puts "Searching for routes from #{start_id} to #{end_id}"
    shortest_way(start_id, end_id, country)
  end



end

start()