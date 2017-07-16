# frozen_string_literal: true

module Sense
  module Sensors
    # Historical sensor data, sampled every five minutes.
    #
    # @param hours [Fixnum] how many hours of data to fetch
    # @return [Hash]
    #
    # @note Seems to top out at around 920 hours -- higher numbers result in
    #   empty data; probably some timeout on the server cancels the lookup and
    #   falls back to empty data.
    # @note If +from_utc+ is more than about 11 hours in the past the server
    #   will give a 400 Bad Request response. You can request far more than
    #   11 +hours+, so +from_utc+ is always set to the current UTC timestamp.
    #
    # @example
    #   {
    #     "sound" => [
    #       {
    #         "datetime" => 1500001200000,
    #         "value" => 31.155998,
    #         "offset_millis" => -25200000
    #       },
    #       ...
    #     ],
    #     "humidity" => [
    #       {
    #         "datetime" => 1500001200000,
    #         "value" => 42.710575,
    #         "offset_millis" => -25200000
    #       },
    #       ...
    #     ],
    #     "light" => [
    #       {
    #         "datetime" => 1500001200000,
    #         "value" => 302.38342,
    #         "offset_millis" => -25200000
    #       },
    #       ...
    #     ],
    #     "temperature" => [
    #       {
    #         "datetime" => 1500001200000,
    #         "value" => 16.91,
    #         "offset_millis" => -25200000
    #       },
    #       ...
    #     ],
    #     "particulates" => [
    #       {
    #         "datetime" => 1500001200000,
    #         "value" => 7.8401413,
    #         "offset_millis" => -25200000
    #       },
    #       ...
    #     ]
    #   }

    def sensors_historical(hours:)
      require 'active_support/all'
      timestamp = Time.now.utc.to_i * 1000

      get("/v1/room/all_sensors/hours?quantity=#{hours}&from_utc=#{timestamp}")
    end

    # Known +type+s:
    # * +TEMPERATURE+
    # * +HUMIDITY+
    # * +LIGHT+
    # * +PARTICULATES+
    # * +SOUND+
    #
    # @return [Array<Hash>]
    #
    # @example
    #   [
    #     {
    #       "name" => "Temperature",
    #       "type" => "TEMPERATURE",
    #       "unit" => "CELSIUS",
    #       "message" => "It's a bit warm.",
    #       "scale" => [{
    #         "name" => "Cold",
    #         "min" => nil,
    #         "max" => 9.99,
    #         "condition" => "ALERT"
    #       }, {
    #         "name" => "Cool",
    #         "min" => 10.0,
    #         "max" => 14.99,
    #         "condition" => "WARNING"
    #       }, {
    #         "name" => "Ideal",
    #         "min" => 15.0,
    #         "max" => 19.99,
    #         "condition" => "IDEAL"
    #       }, {
    #         "name" => "Warm",
    #         "min" => 20.0,
    #         "max" => 25.99,
    #         "condition" => "WARNING"
    #       }, {
    #         "name" => "Hot",
    #         "min" => 26.0,
    #         "max" => nil,
    #         "condition" => "ALERT"
    #       }],
    #       "condition" => "WARNING",
    #       "value" => 20.32
    #     }
    #     ...
    #   ]

    def sensors
      data = get('/v2/sensors')
      data['sensors']
    end

    def update_sensors(data)
      post('/v2/sensors', data)
    end
  end
end
