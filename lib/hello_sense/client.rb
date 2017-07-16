# frozen_string_literal: true

require 'json'
require 'net/http'

module Sense
  class Client
    API_HOST = 'https://api.hello.is'.freeze

    include Account
    include Alarms
    include Alerts
    include App
    include Devices
    include Expansions
    include Firmware
    include Insights
    include Notifications
    include Questions
    include Sensors
    include Session
    include Sharing
    include SleepSounds
    include Speech
    include Stats
    include Store
    include Support
    include Timeline
    include Trends

    attr_reader :access_token

    # XXX
    #
    # @param options [Hash]
    # @option options [String] :access_token
    # @option options [String] :client_id
    # @option options [String] :client_secret
    # @option options [String] :password
    # @option options [String] :username
    def initialize(options = {})
      @access_token = options[:access_token]
      @client_id = options[:client_id]
      @client_secret = options[:client_secret]
      @password = options[:password]
      @username = options[:username]

      @access_token = authorize_with_password! if @access_token.nil?
      puts "** Using #{@access_token} as Sense access token"
    end

    # XXX
    #
    # @param path [String] relative path to use for the request
    def delete(path)
      response = connection.delete(path, headers)
      data_or_error(response)
    end

    # XXX
    #
    # @param path [String] relative path to use for the request
    def get(path)
      response = connection.get(path, headers)
      data_or_error(response)
    end

    # XXX
    #
    # @param path [String] relative path to use for the request
    # @param data [Hash] data to send
    def patch(path, data)
      # XXX may need +set_form_data+
      response = connection.patch(path, data, headers)
      data_or_error(response)
    end

    # XXX
    #
    # @param path [String] relative path to use for the request
    # @param data [Hash] data to send
    def post(path, data)
      request = Net::HTTP::Post.new(path, headers)
      request.set_form_data(data)
      response = connection.request(request)
      data_or_error(response)
    end

    # @param path [String] relative path to use for the request
    # @param data [Hash] data to send
    def put(path, data)
      request = Net::HTTP::Put.new(path, headers)
      request.set_form_data(data)
      response = connection.request(request)
      data_or_error(response)
    end

    private

    # XXX
    #
    # @return [Net::HTTP]
    def connection
      @connection ||= begin
        require 'openssl'
        require 'uri'

        uri = URI.parse(API_HOST)
        http = Net::HTTP.new(uri.host, uri.port)
        http.ssl_version = :TLSv1_2
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER

        http
      end
    end

    # XXX
    #
    # @param response [Net::HTTPResponse]
    # @return [Array, Hash, nil]
    # @raise [APIError]
    def data_or_error(response)
      if response.code.to_i < 300
        return response.body ? JSON.parse(response.body) : nil
      end

      raise APIError.new(response)
    end

    # XXX
    #
    # @return [Hash]
    def headers
      {
        Accept: 'application/json',
        Authorization: "Bearer #{@access_token}",
        :'User-Agent' => "hello-sense Ruby gem/#{VERSION}",
      }.freeze
    end
  end
end
