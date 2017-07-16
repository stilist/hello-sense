# frozen_string_literal: true

module Sense
  module App
    # Check if a new version of the app has been released.
    #
    # @param app_version [String]
    # @param language [String]
    # @param platform [String]
    # @return [Hash]
    #
    # @example
    #   client.check_for_update('10000000', 'en', 'android')

    def check_for_update(app_version, language, platform)
      post('/v1/app/checkin', app_version: app_version,
                              lang_code: language,
                              platform: platform)
    end
  end
end
