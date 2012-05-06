class MessagingController < ApplicationController
  before_filter :authenticate_user!

  def send
    from = current_user
    to = User.find(params[:id])
    from.send_msg(to, params[:topic], params[:message])
    redirect_to 'message_path', notice: "Message sent to #{to.name}"
  end

  def all
    @messages = current_user.msg
  end

  def inbox
    @messages = current_user.recv
  end

  def sent
    @messages = current_user.sent
  end 
end

=begin
# message file api
:topic,
  :body,
  :received_messageable_type,
  :received_messageable_id,
  :sent_messageable_type,
  :sent_messageable_id,
  :opened

# user1 send message to user2
# @user1.send_msg(@user2, "Message to user2", "Hi user 2!;-)")
# @user2.send_msg(@user1, "Re: Message to user2", "Hi there!:)")
#
#mail = todd.mailbox[:inbox].unread_mail[0] 
#todd.reply_to_sender(mail, "not sure, probably having a few dozen cocktails.")
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


=end
