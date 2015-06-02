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
end
