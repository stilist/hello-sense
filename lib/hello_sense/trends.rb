# frozen_string_literal: true

module Sense
  module Trends
    # @param timescale [String] one of +'LAST_WEEK'+, +'LAST_MONTH'+, +'LAST_3_MONTHS'+
    # @return [Hash]
    #
    # @example
    #   {
    #     "available_time_scales" => [
    #       "LAST_WEEK",
    #       "LAST_MONTH",
    #       "LAST_3_MONTHS"
    #     ],
    #     "graphs" => [{
    #       "time_scale" => "LAST_WEEK",
    #       "title" => "Sleep Score",
    #       "data_type" => "SCORES",
    #       "graph_type" => "GRID",
    #       "min_value" => 71.0,
    #       "max_value" => 86.0,
    #       "sections" => [{
    #         "values" => [81.0, 80.0, 78.0, 71.0, 79.0, 86.0, 77.0],
    #         "titles" => ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"],
    #         "highlighted_values" => [6],
    #         "highlighted_title" => 6
    #       }],
    #       "condition_ranges" => [{
    #         "min_value" => 80.0,
    #         "max_value" => 100.0,
    #         "condition" => "IDEAL"
    #       }, {
    #         "min_value" => 60.0,
    #         "max_value" => 79.0,
    #         "condition" => "WARNING"
    #       }, {
    #         "min_value" => 0.0,
    #         "max_value" => 59.0,
    #         "condition" => "ALERT"
    #       }],
    #       "annotations" => [{
    #         "title" => "Avg. Weekdays",
    #         "value" => 78.8,
    #         "data_type" => "SCORES",
    #         "condition" => "WARNING"
    #       }, {
    #         "title" => "Avg. Weekends",
    #         "value" => 79.0,
    #         "data_type" => "SCORES",
    #         "condition" => "WARNING"
    #       }, {
    #         "title" => "Avg. Overall",
    #         "value" => 78.9,
    #         "data_type" => "SCORES",
    #         "condition" => "WARNING"
    #       }]
    #     }, {
    #       "time_scale" => "LAST_WEEK",
    #       "title" => "Sleep Duration",
    #       "data_type" => "HOURS",
    #       "graph_type" => "BAR",
    #       "min_value" => 7.483333,
    #       "max_value" => 9.083333,
    #       "sections" => [{
    #         "values" => [7.85, 8.383333, 7.483333, 7.7, 7.8, 9.083333, 7.6833334],
    #         "titles" => ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"],
    #         "highlighted_values" => [2, 5],
    #         "highlighted_title" => 6
    #       }],
    #       "condition_ranges" => [],
    #       "annotations" => [{
    #         "title" => "Avg. Weekdays",
    #         "value" => 8.1,
    #         "data_type" => "HOURS",
    #         "condition" => nil
    #       }, {
    #         "title" => "Avg. Weekends",
    #         "value" => 7.8,
    #         "data_type" => "HOURS",
    #         "condition" => nil
    #       }, {
    #         "title" => "Avg. Overall",
    #         "value" => 8.0,
    #         "data_type" => "HOURS",
    #         "condition" => nil
    #       }]
    #     }, {
    #       "time_scale" => "LAST_WEEK",
    #       "title" => "Sleep Depth",
    #       "data_type" => "PERCENTS",
    #       "graph_type" => "BUBBLES",
    #       "min_value" => 0.0,
    #       "max_value" => 1.0,
    #       "sections" => [{
    #         "values" => [0.068022884, 0.5591227, 0.3728544],
    #         "titles" => ["LIGHT", "MEDIUM", "DEEP"],
    #         "highlighted_values" => [],
    #         "highlighted_title" => nil
    #       }],
    #       "condition_ranges" => [],
    #       "annotations" => []
    #     }]
    #   }

    def trends(timescale)
      get("/v2/trends/#{timescale}")
    end
  end
end
