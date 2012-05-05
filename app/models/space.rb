class Space < ActiveRecord::Base
  attr_accessible :about, :availability, :capacity, :description, :equipment, :hourly_pricing, :location, :name, :rooms, :size
  has_attached_file :profile_picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  attr_accessible :profile_picture

end
