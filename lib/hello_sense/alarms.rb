# frozen_string_literal: true

module Sense
  module Alarms
    # @return [Hash]
    #
    # @example
    #   {
    #     "expansions" => [],
    #     "voice" => [],
    #     "classic" => [{
    #       "year" => 0,
    #       "month" => 0,
    #       "day_of_month" => 0,
    #       "hour" => 7,
    #       "minute" => 30,
    #       "day_of_week" => [1, 2, 3, 4, 5],
    #       "repeated" => true,
    #       "enabled" => true,
    #       "editable" => true,
    #       "smart" => true,
    #       "sound" => {
    #         "id" => 5,
    #         "name" => "Dusk",
    #         "url" => ""
    #       },
    #       "id" => "FDED667B-9E91-43F5-91DE-258AC1FEE9C2",
    #       "source" => "MOBILE_APP",
    #       "expansions" => []
    #     }]
    #   }

    def alarms
      get('/v2/alarms')
    end

    # @return [Array<Hash>]
    #
    # @example
    #   [
    #     {
    #       "id" => 5,
    #       "name" => "Dusk",
    #       "url" => "https://hello-audio.s3.amazonaws.com/ringtones/Dusk.mp3?x-amz-security-token=XXX"
    #     },
    #   ]

    def alarm_sounds
      get('/v1/alarms/sounds')
    end

    def update_alarm(data)
      timestamp = DateTime.now
        .new_offset(0)
        .iso8601
      post("/v2/alarms/#{timestamp}", data)
    end
  end
end
