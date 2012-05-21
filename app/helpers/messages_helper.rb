module MessagesHelper
  def other_guys_picture(message)
      user = message.from == current_user ? message.to : message.from
      user.profile_picture.url(:thumb)
  end
end
