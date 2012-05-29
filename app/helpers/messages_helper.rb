module MessagesHelper
  def other_guys_picture(message)
      user = message.from == current_user ? message.to : message.from
      user.profile_picture.url(:thumb)
  end

  def new_tag(message)
    if message.to == current_user and not message.opened?
      styles = %w{badge badge-info}
      mark = link_to("Mark As Read", mark_message_path(message), method: :post)
      inside = content_tag(:span, 'New', class:styles)
      content_tag(:div, inside + mark, class:'status')
    end
  end
end
