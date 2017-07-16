# frozen_string_literal: true

module Sense
  module SleepSounds
    # @return [Hash]
    #
    # @example
    #   {
    #     "availableDurations" => [{
    #       "durations" => {
    #         "id" => 2,
    #         "name" => "30 Minutes"
    #       }, {
    #         "id" => 3,
    #         "name" => "1 Hour"
    #       }]
    #     },
    #     "availableSounds" => [{
    #       "sounds" => {
    #         "id" => 18,
    #         "preview_url" => "https://s3.amazonaws.com/hello-audio/sleep-tones-preview/Aura.mp3",
    #         "name" => "Aura"
    #       }, {
    #         "id" => 20,
    #         "preview_url" => "https://s3.amazonaws.com/hello-audio/sleep-tones-preview/Nocturne.mp3",
    #         "name" => "Nocturne"
    #       }],
    #       "state" => "OK"
    #     },
    #     "status" => {
    #       "playing" => false,
    #       "sound" => nil,
    #       "duration" => nil,
    #       "volume_percent" => nil
    #     }
    #   }

    def sounds_combined_state
      get('/v2/sleep_sounds/combined_state')
    end

    # @return [Hash]
    #
    # @example
    #   {
    #     "durations" => [{
    #       "id" => 2,
    #       "name" => "30 Minutes"
    #     }, {
    #       "id" => 3,
    #       "name" => "1 Hour"
    #     }]
    #   }

    def sound_durations
      get('/v2/sleep_sounds/durations')
    end

    def play_sound
      post('/v2/sleep_sounds/play')
    end

    # @return [Hash]
    #
    # @example
    #   {
    #     "sounds" => [{
    #       "id" => 18,
    #       "preview_url" => "https://s3.amazonaws.com/hello-audio/sleep-tones-preview/Aura.mp3",
    #       "name" => "Aura"
    #     }, {
    #       "id" => 20,
    #       "preview_url" => "https://s3.amazonaws.com/hello-audio/sleep-tones-preview/Nocturne.mp3",
    #       "name" => "Nocturne"
    #     }],
    #     "state" => "OK"
    #   }

    def sounds
      get('/v2/sleep_sounds/sounds')
    end

    # @return [Hash]
    #
    # @example
    #   {
    #     "playing" => false,
    #     "sound" => nil,
    #     "duration" => nil,
    #     "volume_percent" => nil
    #   }

    def sounds_status
      get('/v2/sleep_sounds/status')
    end

    def stop_sounds(data)
      post('/v2/sleep_sounds/stop', data)
    end
  end
end
