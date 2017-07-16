# frozen_string_literal: true

module Sense
  module Timeline
    # Known +event_type+s:
    # * +FELL_ASLEEP+
    # * +GENERIC_MOTION+
    # * +GENERIC_SOUND+
    # * +GOT_IN_BED+
    # * +GOT_OUT_OF_BED+
    # * +IN_BED+
    # * +WOKE_UP+
    #
    # Known +sleep_state+s:
    # * +AWAKE+
    # * +LIGHT+
    # * +MEDIUM+
    # * +SOUND+
    #
    # Known +metrics+ +name+s:
    # * +fell_asleep+
    # * +sound_sleep+
    # * +time_to_sleep+
    # * +times_awake+
    # * +total_sleep+
    # * +woke_up+
    # * +humidity+
    # * +light+
    # * +particulates+
    # * +sound+
    # * +temperature+
    #
    # @param date [String] a date in 'yyyy-MM-dd' format
    # @return [Hash]
    #
    # @example
    #   {
    #     "score" => 69,
    #     "score_condition" => "WARNING",
    #     "message" => "You were asleep for **9.0 hours**, and sleeping soundly for 6.5 hours.",
    #     "date" => "2017-01-01",
    #     "sleep_periods" => [
    #       "NIGHT"
    #     ],
    #     "events" => [{
    #       "timestamp" => 1483340220000,
    #       "timezone_offset" => -28800000,
    #       "duration_millis" => 60000,
    #       "message" => "You went to bed.",
    #       "sleep_depth" => 0,
    #       "sleep_state" => "AWAKE",
    #       "event_type" => "GOT_IN_BED",
    #       "sleep_period" => "NIGHT",
    #       "valid_actions" => [
    #         "ADJUST_TIME",
    #         "VERIFY",
    #         "INCORRECT"
    #       ]
    #     }],
    #     "metrics" => [{
    #       "name" => "total_sleep",
    #       "value" => 537,
    #       "unit" => "MINUTES",
    #       "condition" => "IDEAL"
    #     }],
    #     "locked_down" => false
    #   }

    def timeline(date)
      get("/v2/timeline/#{date}")
    end

    def create_timeline_event(date, type, timestamp, data)
      put("/v2/timeline/#{date}/events/#{type}/#{timestamp}", data)
    end

    def update_timeline_event(date, type, timestamp, data)
      patch("/v2/timeline/#{date}/events/#{type}/#{timestamp}", data)
    end

    def remove_timeline_event(date, type, timestamp)
      delete("/v2/timeline/#{date}/events/#{type}/#{timestamp}")
    end
  end
end
