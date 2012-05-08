module UsersHelper
  MAP_URL = "http://maps.google.com/maps/api/staticmap?&sensor=false"

  # shows a map with positions for up to 25 users
  def map_tag(location, users, size="450x300")
    users = users.take(25)
    markers = []
    users.each_with_index do |user, i| 
      markers << "&markers=color:blue%7Clabel:#{iToAZ(i)}%7C#{user.latitude}%2C#{user.longitude}"
    end

#raise markers.to_yaml
    image_tag MAP_URL + "&size=#{size}&center=#{location}" + markers.join
  end

  private
  def iToAZ(i)
    (i + 65).chr if (0..26) === i
  end
end
