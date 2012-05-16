class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def all
    @messages = current_user.messages
  end

  def testfire
    user = current_user
    to = User.find(current_user.id  == 1? 2 : 1)
    msg = current_user.send_message(to, "hello-test", "body")
    redirect_to messages_inbox_path, notice: to.sent_messages_relation.inspect

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

  def reply_message 
    message = Message.find(params[:id])
    if message.to == current_user
      message.reply(topic: params[:subject], body: params[:body])
    end
    
  end

  def send_message
    from = current_user
    to = User.find(params[:id])
    from.send_message(to, params[:subject], params[:body])
    respond_to do |format|
      format.html { redirect_to 'inbox_messages', 
                                 notice: "Message sent to #{to.name}"}
      format.js {"sent" if request.xhr? }
    end
  end

end

#https://github.com/LTe/acts-as-messageable 
