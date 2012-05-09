module ApplicationHelper
  MAP_URL = "http://maps.google.com/maps/api/staticmap?&sensor=false"

  # shows a map with positions for up to 26 items
  def map_tag(location, collection, size="640x300")
    collection = collection.take(26)
    markers = []
    collection.each_with_index do |item, i| 
      markers << "&markers=color:blue%7Clabel:#{iToAZ(i)}%7C#{item.latitude}%2C#{item.longitude}"
    end

    image_tag MAP_URL + "&size=#{size}&center=#{location}" + markers.join
  end

  private
  def iToAZ(i)
    (i + 65).chr if (0..26) === i
  end
end
