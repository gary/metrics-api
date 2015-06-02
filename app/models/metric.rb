require 'ostruct'
require 'rom-csv'

setup = ROM.setup(:csv, METRICS)
setup.relation(:metrics) do
  def by_metric_id(metric_id)
    restrict(metric_id: metric_id)
  end

  def by_start_date(start_date)
    restrict(start_date: start_date)
  end

  def by_time_range_length(time_range_length)
    restrict(time_range_length: time_range_length)
  end

  def by_value(value)
    restrict(value: value)
  end

  def by_last_calculated_at(last_calculated_at)
    restrict(last_calculated_at: last_calculated_at)
  end

  def by_end_date(end_date)
    restrict(end_date: end_date)
  end
end

class Metric < OpenStruct
  JOHN_TIME_START = Date.new(2009, 1, 1)
  private_constant :JOHN_TIME_START

  def self.to_john_time(days)
    JOHN_TIME_START.days_since(days)
  end
end

setup.mappers do
  define(:metrics) do
    register_as :entity
    model Metric
  end
end
