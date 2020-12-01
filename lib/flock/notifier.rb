require 'flock/notifier/version'
require 'flock/notifier/connection'

module Flock
  class Notifier
    SEND_MESSAGE_HOOK_BASE_URL = 'https://api.flock.com/hooks/sendMessage/'

    def initialize webhook_uid
      endpoint    = SEND_MESSAGE_HOOK_BASE_URL + webhook_uid
      @connection = Connection.new endpoint
    end

    def ping(message)
      @connection.post(message)
    end
  end
end
