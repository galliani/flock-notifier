# frozen_string_literal: true
# encoding: utf-8

require "spec_helper"

RSpec.describe Flock::Notifier do
  let(:webhook_uid) { 'just-some-random-uid-of-the-webhook-for-the-channel' }

  # The list of arguments and the corresponding expected payloads to be sent to Flock
  {
    { text: "hello" } => { text: "hello" },
  }.each do |args, payload|
    it "sends correct payload for #post(#{args})" do
      stub =
        stub_request(:post, Flock::Notifier::SEND_MESSAGE_HOOK_BASE_URL + webhook_uid)
        .with(body: { text: args[:text] }.to_json)
        .to_return(status: 200, body: { "uid": 'random-string-uid' }.to_json)

      notifier = Flock::Notifier.new(webhook_uid)
      notifier.post(args[:text])

      expect(stub).to have_been_requested
    end
  end

  it 'has a version number' do
    expect(Flock::Notifier::VERSION).not_to be nil
  end
end