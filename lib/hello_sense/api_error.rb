# frozen_string_literal: true

module Sense
  class APIError < StandardError
    attr_reader :code, :description, :response, :type

    # @todo Document param
    def initialize(response)
      @code = response.code
      @description = response.code_type
      @response = response
      @type = response.error_type
    end

    def message
      "#{@type}: #{@description} (#{@code})"
    end
    alias to_s message
  end
end
