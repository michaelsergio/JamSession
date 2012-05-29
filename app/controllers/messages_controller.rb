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

  def reply
    message = current_user.received_messages.find(params[:id])
    message.reply(topic: params[:subject], body: params[:body])
    
  end

  def send_message
    from = current_user
    to = User.find(params[:id])
    from.send_message(to, params[:subject], params[:body])
    respond_to do |format|
      format.html { redirect_to inbox_messages_path, 
                                 notice: "Message sent to #{to.name}"}
      format.js { render json: "sent".to_json if request.xhr? }
    end
  end

  def mark
    message = current_user.received_messages.find(params[:id])
      message.mark_as_read
    redirect_to :back
  end

end

#https://github.com/LTe/acts-as-messageable 
