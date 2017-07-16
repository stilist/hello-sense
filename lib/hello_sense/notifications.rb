# frozen_string_literal: true

module Sense
  module Notifications
    # @return [Array<Hash>]
    #
    # @example
    #   [
    #     {
    #       "type" => "SLEEP_SCORE",
    #       "enabled" => true,
    #       "name" => Sleep Score"
    #     }, {
    #       "type" => "SYSTEM",
    #       "enabled" => true,
    #       "name" => System Alerts"
    #     }, {
    #       "type" => "SLEEP_REMINDER",
    #       "enabled" => true,
    #       "name" => Sleep Reminder"
    #     }
    #   ]

    def notifications
      get('/v1/notifications')
    end

    def create_notification(data)
      put('/v1/notifications', data)
    end

    def update_notifications(data)
      post('/v1/notifications/registration', data)
    end
  end
end
