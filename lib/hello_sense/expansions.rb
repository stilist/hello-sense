# frozen_string_literal: true

module Sense
  module Expansions
    # @return [Array<Hash>]
    #
    # @example
    #   [
    #     {
    #       "id" => 1,
    #       "service_name" => "NEST",
    #       "device_name" => "Nest Thermostat",
    #       "company_name" => "Nest",
    #       "description" => "Connecting Sense to your Nest Learning Thermostat allows you to control your thermostat with Voice, or automatically set a specific temperature ahead of your Sense alarm, so you wake up to your ideal temperature every morning.",
    #       "icon" => {
    #         "phone_1x" => "https://hello-data.s3.amazonaws.com/expansions/icon-nest@1x.png",
    #         "phone_2x" => "https://hello-data.s3.amazonaws.com/expansions/icon-nest@2x.png",
    #         "phone_3x" => "https://hello-data.s3.amazonaws.com/expansions/icon-nest@3x.png"
    #       },
    #       "auth_uri" => "https://api.hello.is/v2/expansions/1/auth",
    #       "token_uri" => nil,
    #       "refresh_uri" => nil,
    #       "category" => "TEMPERATURE",
    #       "created" => 1495381368634,
    #       "completion_uri" => "https://api.hello.is/v2/expansions/redirect",
    #       "state" => "NOT_CONNECTED",
    #       "value_range" => {
    #         "min" => 9,
    #         "max" => 32
    #       }
    #     }
    #   ]
    def expansions
      get('/v2/expansions')
    end

    def expansion(expansion_id)
      get("/v2/expansions/#{expansion_id}")
    end

    def update_expansion(expansion_id, data)
      patch("/v2/expansions/#{expansion_id}", data)
    end

    def expansion_configurations(expansion_id)
      get("/v2/expansions/#{expansion_id}/configurations")
    end

    def update_expansion_configurations(expansion_id, data)
      patch("/v2/expansions/#{expansion_id}/configurations", data)
    end
  end
end
