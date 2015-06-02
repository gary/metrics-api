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
        get do
                    
        end
      end
    end
  end
end
