# frozen_string_literal: true

module Sense
  module Support
    # @return [Array<Hash>]
    #
    # @example
    #   [
    #     {
    #       "topic" => "pairing_sense",
    #       "display_name" => Pairing your Sense"
    #     },
    #     {
    #       "topic" => "pairing_a_sleep_pill",
    #       "display_name" => Pairing your Sleep Pill"
    #     }
    #   ]

    def support_topics
      get('/v1/support/topics')
    end
  end
end
