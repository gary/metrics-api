require 'spec_helper'

require 'app/models/metric'

describe Metric do
  before do
    stub_const('METRICS', File.expand_path('../../fixtures/metrics.csv',
                                           __FILE__))
  end

  xit 'is all framework at the moment' do
  end
end
