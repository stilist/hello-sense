# frozen_string_literal: true

# Defines the namespace for the +hello-sense+ gem.
module Sense
  require_relative 'hello_sense/account'
  require_relative 'hello_sense/alarms'
  require_relative 'hello_sense/alerts'
  require_relative 'hello_sense/app'
  require_relative 'hello_sense/devices'
  require_relative 'hello_sense/expansions'
  require_relative 'hello_sense/firmware'
  require_relative 'hello_sense/insights'
  require_relative 'hello_sense/notifications'
  require_relative 'hello_sense/questions'
  require_relative 'hello_sense/sensors'
  require_relative 'hello_sense/sharing'
  require_relative 'hello_sense/sleep_sounds'
  require_relative 'hello_sense/speech'
  require_relative 'hello_sense/stats'
  require_relative 'hello_sense/store'
  require_relative 'hello_sense/support'
  require_relative 'hello_sense/timeline'
  require_relative 'hello_sense/trends'

  require_relative 'hello_sense/api_error'
  require_relative 'hello_sense/constants'
  require_relative 'hello_sense/session'
  require_relative 'hello_sense/version'
  require_relative 'hello_sense/client'
end
