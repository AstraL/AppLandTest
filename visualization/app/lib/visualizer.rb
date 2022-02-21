class Visualizer
  attr_reader :events

  def initialize(events)
    @events = events
  end

  def helpers
    filter_hash("app/helpers")
  end

  def controllers
    filter_hash("app/controllers")
  end

  def models
    filter_hash("app/models")
  end

  private

  def filter_hash(path)
    parsed_hash.filter { |event| event[:path].starts_with?(path) }
  end

  def parsed_hash
    @parsed_hash ||= events.filter { |event| event_present?(event) && ruby_file?(event) && belongs_to_app?(event) }
  end

  def event_present?(event)
    event[:path].present?
  end

  def ruby_file?(event)
    event[:path].ends_with?(".rb")
  end

  def belongs_to_app?(event)
    event[:path].starts_with?("app/")
  end
end
