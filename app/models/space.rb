class Space < ActiveRecord::Base
  attr_accessible :about, :availability, :capacity, :description, :equipment, :hourly_pricing, :location, :name, :rooms, :size
end
