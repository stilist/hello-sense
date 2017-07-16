# frozen_string_literal: true

module Sense
  module Questions
    # @return [Array<Hash>]
    #
    # @example
    #   [
    #     {
    #       "id" => 2,
    #       "account_question_id" => 100000,
    #       "text" => "How was your sleep last night?",
    #       "choices" => {
    #         "id" => 69,
    #         "text" => "Great",
    #         "question_id" => 2
    #       }, {
    #         "id" => 70,
    #         "text" => "Okay",
    #         "question_id" => 2
    #       }, {
    #         "id" => 71,
    #         "text" => "Poor",
    #         "question_id" => 2
    #       }],
    #       "ask_local_date" => 1483257600000,
    #       "type" => "CHOICE",
    #       "ask_time" => "MORNING"
    #     }
    #   ]

    def questions
      get('/v1/questions')
    end

    def skip_question(data)
      put('/v1/questions/skip', data)
    end

    def update_questions(data)
      post('/v1/questions/save', data)
    end
  end
end
