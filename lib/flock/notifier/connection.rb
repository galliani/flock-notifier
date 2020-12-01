# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

module Flock
  class Notifier
    class Connection
      def initialize(incoming_webhook_url)
        uri       = URI.parse(incoming_webhook_url)
        header    = { 'Content-Type': 'application/json' }

        @http         = Net::HTTP.new(uri.host, uri.port)
        @http.use_ssl = true

        @request = Net::HTTP::Post.new(uri.request_uri, header)
      end

      def post(message)
        payload       = { "text": message }
        @request.body = payload.to_json

        # Send the request
        @http.request(@request)
      end
    end
  end
end