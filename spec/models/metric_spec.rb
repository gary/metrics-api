require 'spec_helper'

require 'app/models/metric'

describe Metric do
  before do
    stub_const('METRICS', File.expand_path('../../fixtures/metrics.csv',
                                           __FILE__))
  end

  describe '.to_john_time' do
    let(:john_time) { Date.new(2009, 1, 1) }

    context 'with a positive number' do
      subject(:ten_days_john_time) { Metric.to_john_time(10) }

      it 'returns the number of days since Jan 1, 2009' do
        expect(ten_days_john_time).to eq john_time + 10.days
      end
    end

    context 'with a negative number' do
      subject(:ten_days_before_john_time) { Metric.to_john_time(-10) }

      it 'returns the number of days before Jan 1, 2009' do
        expect(ten_days_before_john_time).to eq john_time - 10.days
      end
    end
  end

  describe '#to_json' do
    subject do
      Metric.new({
                   end_date: 949,
                   last_calculated_at: 1315325102,
                   metric_id: 4,
                   start_date: 949,
                   time_range_length: 1,
                   value: 4,
                 }).to_json
    end
    
    it do
      is_expected.
        to eq "{\"json_class\":\"Metric\",\"data\":[949,1315325102,4,949,1,4]}"
    end
  end
end
