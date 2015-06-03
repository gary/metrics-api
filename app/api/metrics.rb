require 'env'
require 'grape'
require 'json'

require 'app/models/metric'

module Metrics
  class API < Grape::API
    format :json

    rom = ROM.finalize.env

    resource :metrics do

      get '/' do
        rom.relation(:metrics).as(:entity).to_a.to_json
      end

      route_param :id do
        params do
          requires :id, type: Integer, desc: 'The id of the metric'
        end
        get do
          rom.relation(:metrics).as(:entity).by_metric_id(params[:id]).
            to_a.to_json
        end
      end
    end
  end
end
