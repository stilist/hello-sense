# frozen_string_literal: true

module Sense
  module Account
    EMAIL_PATTERN = /^.+@.+\\..+$/
    MIN_PASSWORD_LENGTH = 6

    # Get the current
    #
    # @return [Hash]
    #
    # @example
    #   {
    #     "email" => "drisha.wabudeya@example.org",
    #     "tz" => -28800000,
    #     "name" => "Drisha",
    #     "firstname" => "Drisha",
    #     "lastname" => "Wabudeya",
    #     "gender" => "FEMALE",
    #     "gender_other" => "",
    #     "height" => 160,
    #     "weight" => 68000,
    #     "created" => 1420099200000,
    #     "last_modified" => 1420099200000,
    #     "email_verified" => true,
    #     "profile_photo" => nil,
    #     "ext_id" => "fded667b-9e91-43f5-91de-258ac1fee9c2",
    #     "dob" => "1990-01-01",
    #     "id" => "fded667b-9e91-43f5-91de-258ac1fee9c2"
    #   }

    def account
      get('/v1/account')
    end

    # @param data [Hash]
    #
    # @see #account for fields

    def create_account(data)
      put('/v1/account', data)
    end

    # @param data [Hash]
    #
    # @see #account for fields

    def update_account(data)
      post('/v1/account', data)
    end

    # @return [Hash]
    #
    # @example
    #   {
    #     "TIME_TWENTY_FOUR_HOUR" => true,
    #     "PUSH_SCORE" => true,
    #     "WEIGHT_METRIC" => false,
    #     "TEMP_CELSIUS" => true,
    #     "HEIGHT_METRIC" => false,
    #     "ENHANCED_AUDIO" => true,
    #     "PUSH_ALERT_CONDITIONS" => true
    #   }

    def preferences
      get('/v2/account/preferences')
    end

    def update_preferences(data)
      put('/v2/account/preferences', data)
    end

    def update_photo(data)
      post('/v1/photo/profile', data)
    end

    def delete_profile_picture
      delete('/v1/photo/profile')
    end

    # @param email [String] the new email address for the account
    # @return XXX

    def update_email(email)
      raise InvalidEmailError if !normalize(email).match(EMAIL_PATTERN)

      data = account.merge('email' => email)

      post('/v1/account/email', data)
    end

    # @param current_password [String] the user's current password
    # @param new_password [String] the new password to use
    #
    # @note
    #
    # @example
    #   client.update_password('My super secure password!',
    #                          'My even better new password (my second)!')

    def update_password(current_password, new_password)
      raise InvalidPasswordError if normalize(new_password).length < MIN_PASSWORD_LENGTH

      post('/v1/account/password', currentPassword: current_password,
                                   newPassword: new_password)
    end

    # @return [Hash]
    #
    # @example
    #   {
    #     "timezone_offset" => -25200000,
    #     "timezone_id" => "America/Los_Angeles"
    #   }

    def current_timezone
      get('/v1/timezone')
    end

    def update_timezone(data)
      post('/v1/timezone', data)
    end

    private

    def normalize(str = '')
      str.trim
    end
  end
end
