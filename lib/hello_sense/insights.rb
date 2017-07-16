# frozen_string_literal: true

module Sense
  module Insights
    # @return [Array<Hash>]
    #
    # @example
    #   [
    #     {
    #       "account_id" => 100000,
    #       "title" => "Still as the Night",
    #       "message" => "During the last 13 nights, you moved 23% less than the average person using Sense. About **9% of your sleep** consists of agitated sleep.",
    #       "category" => "SLEEP_QUALITY",
    #       "timestamp" => 1483257600000,
    #       "info_preview" => nil,
    #       "image" => {
    #         "phone_1x" => "https://s3.amazonaws.com/hello-data/insights_images/sleep_quality.png",
    #         "phone_2x" => "https://s3.amazonaws.com/hello-data/insights_images/sleep_quality@2x.png",
    #         "phone_3x" => "https://s3.amazonaws.com/hello-data/insights_images/sleep_quality@3x.png"
    #       },
    #       "category_name" => "Sleep Quality",
    #       "insight_type" => "DEFAULT",
    #       "id" => "fded667b-9e91-43f5-91de-258ac1fee9c2"
    #     }
    #   ]

    def insights
      get('/v2/insights')
    end

    # Known +category+s:
    # * +AIR_QUALITY+
    # * +BED_LIGHT_DURATION+
    # * +HUMIDITY+
    # * +LIGHT+
    # * +SLEEP_QUALITY+
    # * +SLEEP_TIME+
    # * +TEMPERATURE+
    # * +WAKE_VARIANCE+
    #
    # @param category [String]
    # @return [Array<Hash>]
    #
    # @example
    #  [{
    #    "id" => 5,
    #    "category" => "AIR_QUALITY",
    #    "title" => "Clean air, better sleep",
    #    "text" => "Clean air is an important part of a healthy environment. A high concentration of airborne particulates (microscopic fragments of matter that can penetrate deep into your lungs) can irritate your throat and airways, exacerbate asthma symptoms, and disrupt your sleep.\n\nParticulates can come from indoor sources of pollutants like smoke, cooking fumes, and even some household cleaners. You should always take care to minimize your exposure to these types of pollutants, and open a window to help with ventilation if necessary.\n\nParticulate pollution can also come from outdoor sources, both natural and artificial. You can check the AirNow website to see if there’s an air quality advisory for your area at any time. If so, you should follow EPA recommendations, and limit your time spent outdoors.",
    #    "image_url" => ""
    #  }]

    def insight(category)
      get("/v2/insights/info/#{category}")
    end
  end
end
