# frozen_string_literal: true

module Sense
  module Firmware
    def request_firmware_update
      post('/v1/ota/request_ota')
    end

    # @return [Hash]
    #
    # @example
    #   {
    #     "status" => "NOT_REQUIRED"
    #   }

    def firmware_update_status
      get('/v1/ota/status')
    end
  end
end
