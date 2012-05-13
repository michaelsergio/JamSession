require 'spec_helper.rb'

describe "messaging" do
  let(:romeo) { User.new(name: 'Romeo') }
  let(:juliet) { User.new(name: 'Juliet') }

  it "should send a message to another user" do
    juliet.send_message(romeo, "hey lol!")
    juliet.sent_messages.should have(1).message
    romeo.received_messages.should have(1).message
  end
end
