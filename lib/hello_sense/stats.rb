# frozen_string_literal: true

module Sense
  module Stats
    def update_stats(data)
      patch('/v1/app/stats', data)
    end

    # @return [Hash]
    #
    # @example
    #   {
    #     "has_unread_insights" => true,
    #     "has_unanswered_questions" => true
    #   }

    def unread_stats
      get('/v1/app/stats/unread')
    end
  end
end
