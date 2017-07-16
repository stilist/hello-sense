# frozen_string_literal: true

module Sense
  module Alerts
    # @return [Array]
    #
    # @example
    #   []

    def alerts
      get('/v2/alerts')
    end
  end
end
