class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def all
    @messages = current_user.messages
  end

  def testfire
    msg = current_user.send_message(current_user,"hello-test") 
    raise [current_user.messages(), current_user.sent_messages_relation, msg].to_yaml
    redirect_to messages_inbox_path, notice: current_user.sent_messages_relation.inspect

  end
  def inbox
    @messages = current_user.received_messages
  end

  def sent
    @messages = current_user.sent_messages
  end 

  def show
    @message = current_user.messages.with_id(params[:id])
  end

  def destroy
    @message = current_user.messages.with_id(params[:id]).first
    if @message.destroy
      flash[:notice] = "All ok"
    else
      flash[:error] = "Fail"
    end
  end


  def send_message
    from = current_user
    to = User.find(params[:id])
    from.send_message(to, params[:topic], params[:message])
    redirect_to 'message_path', notice: "Message sent to #{to.name}"
  end

end

#https://github.com/LTe/acts-as-messageable 
