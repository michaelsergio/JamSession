class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def all
    @messages = current_user.messages
  end

  def inbox
    @messages = current_user.received_messages
  end

  def sent
    @messages = current_user.sent_messages
  end 

  def send_message
    from = current_user
    to = User.find(params[:id])
    from.send_msg(to, params[:topic], params[:message])
    redirect_to 'message_path', notice: "Message sent to #{to.name}"
  end

end

#https://github.com/LTe/acts-as-messageable 
