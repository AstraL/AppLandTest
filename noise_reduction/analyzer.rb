class Analyzer
  COEFFICIENT = 0.3.freeze

  def initialize(events, reduction_size = nil)
    @events = events
    @events_size = @events.size
    @reduction_size = reduction_size
  end

  def build_stats
    stats = @events.each_with_object(Hash.new(0)) {|e, res| res["#{e['defined_class']}##{e['method_id']}"] += 1 }
    sorted_stats = Hash[stats.sort_by {|k,v| v}.reverse]
    result(sorted_stats)
  end

  def reduce
    @reduce_count ||= @events_size * (@reduction_size || COEFFICIENT)
  end

  def result(sorted_stats)
    size_limit = 0
    arr = []
    sorted_stats.each do |k,v|
      size_limit += v
      break if size_limit >= remove_size
      arr << k
    end
    return arr
  end
end
