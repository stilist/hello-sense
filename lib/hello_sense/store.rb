# frozen_string_literal: true

module Sense
  module Store
    def send_feedback(data)
      post('/v2/store/feedback', data)
    end
  end
end
