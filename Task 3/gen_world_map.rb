city_size = ARGV[0].to_i
road_size = ARGV[1].to_i

Random.new_seed
rand_tmp = Random.new
File.open('world_map', 'w') do |file|
  file.puts "#{city_size}"
end
for i in (0..1) do

  for i in (0..road_size-1) do

      File.open('world_map', 'a') do |file|
        tmp = rand_tmp.rand(1..city_size)
        file.print "#{tmp} "
      end

  end
  File.open('world_map', 'a') do |file|
    file.puts " "
  end
end


