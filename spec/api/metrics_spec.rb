require 'spec_helper'
require 'spec/support/rack_test'

require 'app/api/metrics'

describe Metrics::API do
  def app
    described_class.new
  end

  before do
    stub_const('METRICS', File.expand_path('../../fixtures/metrics.csv',
                                           __FILE__))
  end

  describe '/metrics' do
    context 'GET' do
      it 'returns all metrics' do
        pending('JSON parser error due to mismatch in Metric serialization')
        get '/metrics'

        # response = JSON.parse(last_response.body)

        expect(last_response.body).to have(5396).items
      end
    end
  end
end
