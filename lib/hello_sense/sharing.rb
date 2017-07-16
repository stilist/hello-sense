# frozen_string_literal: true

module Sense
  module Sharing
    def share_insight
      post('/v2/sharing/insight', {})
    end
  end
end
