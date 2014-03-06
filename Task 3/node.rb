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