class Edge

  attr_reader :start_id,:end_id

  def initialize(start_id,end_id)
    @start_id=start_id
    @end_id=end_id
  end
end