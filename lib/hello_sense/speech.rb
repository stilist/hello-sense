# frozen_string_literal: true

module Sense
  module Speech
    # @return [Array]
    #
    # @example
    #   []

    def onboarding_speech
      get('/v1/speech/onboarding')
    end
  end
end
