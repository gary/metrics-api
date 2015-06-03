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

  describe '/metrics/:id' do
    context 'GET' do
      it 'returns all metrics matching :id' do
        pending('JSON parser error due to mismatch in Metric serialization')
        get '/metrics/40'

        # response = JSON.parse(last_response.body)

        expect(response).to have(5).items
      end
    end
  end
end
