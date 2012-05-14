require 'spec_helper.rb'

describe "messaging" do
  let(:romeo) { User.new(name: 'Romeo') }
  let(:juliet) { User.new(name: 'Juliet') }

  it "should send a message to another user" do
    juliet.send_message(romeo, "hey lol!", "whats up")
    romeo.received_messages.should have(1).message
    juliet.sent_messages.should have(1).message
  end
end
