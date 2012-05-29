module ApplicationHelper
  MAP_URL = "http://maps.google.com/maps/api/staticmap?&sensor=false"

  # shows a map with positions for up to 26 items
  def map_tag(location, collection, size="640x300")
    collection = collection.take(26)
    center = collection.empty? ? "&center=#{location}" : ""

    markers = collection.each_with_index.map do |item, i| 
      "&markers=color:blue%7Clabel:#{iToAZ(i)}%7C#{item.latitude}%2C#{item.longitude}"
    end

    image_tag MAP_URL + "&size=#{size}#{markers.join}#{center}", class: 'map'
  end


  def iToAZ(i)
    (i + 65).chr if (0..26) === i
  end

  def token_input(skillOrStyle)
    if skillOrStyle and not skillOrStyle.empty?
      (skillOrStyle.map {|s| { name: s.name, id: s.id} }).to_json
    end
  end

  def new_messages_tag
    new_count = current_user.received_messages.unread.count
    text = "Messages"
    
    if new_count > 0
      styles = ["badge", "badge-info", "new-messages"]
      text = "#{new_count} New Messages"
    end

    content_tag(:span, link_to(text, inbox_messages_path), class: styles)
  end

end
