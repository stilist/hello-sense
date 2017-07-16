# frozen_string_literal: true

module Sense
  module Session
    def authorize_with_password!
      data = {
        grant_type: 'password',
        client_id: @client_id,
        client_secret: @client_secret,
        username: @username,
        password: @password,
      }
      request = Net::HTTP::Post.new('/v1/oauth2/token',
                                    headers.reject { |key, _| key == :Authorization })
      request.set_form_data(data)
      response = connection.request(request)
      response_data = data_or_error(response)

      response_data['access_token']
    end

    def destroy_token
      delete('/v1/oauth2/token')
    end
  end
end
