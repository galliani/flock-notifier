require 'flock/notifier/version'
require 'base64'
require 'faraday'
require 'faraday_middleware'
require 'json'

module Flock
  class Notifier
    SEND_MESSAGE_HOOK_BASE_URL = 'https://api.flock.com/hooks/sendMessage/'

    def initialize webhook_uid
      @endpoint = webhook_uid

      @connection = Faraday.new(url: SEND_MESSAGE_HOOK_BASE_URL) do |faraday|
        faraday.response    :json
        faraday.request     :json
        faraday.adapter     Faraday.default_adapter
      end

      @connection.options.open_timeout  = 30
      @connection.options.timeout       = 30
    end

    def post(message)
      @connection.post(@endpoint, "text": message)
    end
  end
end
