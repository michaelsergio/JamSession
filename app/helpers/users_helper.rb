module UsersHelper
  def profile_needs_more_info
    if user_signed_in?
      user = current_user
      if user.location.nil? or user.nil?
        content_tag :div, "Need more information in profile!", class: "need_more"
      end
    end
  end
  def map_tag_for_user(user)
    tag 'img', alt:"User", src: "http://maps.google.com/maps/api/staticmap?size=450x300&sensor=false&zoom=16&markers=#{user.latitude}%2C#{user.longitude}" unless user.latitude.nil? 
  end
end
