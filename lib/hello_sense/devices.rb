# frozen_string_literal: true

module Sense
  module Devices
    # @return [Hash]
    #
    # @example
    #   {
    #     "senses" => [{
    #       "id" => "ABCDEF1234567890",
    #       "firmware_version" => "11a1",
    #       "state" => "NORMAL",
    #       "last_updated" => 1483257600000,
    #       "color" => "UNKNOWN",
    #       "wifi_info" => {
    #         "ssid" => "Wifi? Why not!",
    #         "rssi" => 0,
    #         "last_updated" => 1420099200000,
    #         "condition" => "GOOD"
    #       },
    #       "hw_version" => "SENSE"
    #     }],
    #     "pills" => [{
    #       "id" => "0987654321FEDCBA",
    #       "firmware_version" => "2",
    #       "battery_level" => 0,
    #       "last_updated" => 1483257600000,
    #       "state" => "NORMAL",
    #       "color" => "BLUE",
    #       "battery_type" => "REMOVABLE"
    #     }]
    #   }

    def devices
      get('/v2/devices')
    end

    # @return [Hash]
    #
    # @example
    #   {
    #     "sense_id" => "ABCDEF1234567890",
    #     "paired_accounts" => 1
    #   }

    def devices_info
      get('/v2/devices/info')
    end

    def remove_device(device_id)
      delete("/v2/devices/sense/#{device_id}/all")
    end

    def remove_pill(pill_id)
      delete("/v2/devices/pill/#{pill_id}")
    end

    def remove_sense(pill_id)
      delete("/v2/devices/sense/#{pill_id}")
    end

    def voice(device_id)
      get("/v2/devices/sense/#{device_id}/voice")
    end

    def update_voice(device_id, data)
      patch("/v2/devices/sense/#{device_id}/voice", data)
    end

    def swap_device(data)
      put('/v2/devices/swap', data)
    end
  end
end
