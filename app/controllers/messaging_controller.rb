class MessagingController < ApplicationController
  before_filter :authenticate_user!

  def send
    from = current_user
    to = User.find(params[:id])
    from.send_msg(to, params[:message])
    redirect_to 'message_path', notice: "Message sent to #{to.name}"
  end

  def messages
    @messages = current_user.msg
  end

# user1 send message to user2
# @user1.send_msg(@user2, "Message to user2", "Hi user 2!;-)")
# @user2.send_msg(@user1, "Re: Message to user2", "Hi there!:)")
#
# # Show inbox
# @user1.recv
# # Show outbox
# @user1.sent
#
# # Search message
# @user1.msg # all messages (in and out)
# @user1.msg(:from => @user2) # all messages from @user2
# @user1.msg(:to => @user2) # all messages to @user2
# @user1.msg(:id => 2) # message where message.id = 2
end
