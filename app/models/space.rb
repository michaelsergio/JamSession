class Space < ActiveRecord::Base
  attr_accessible :about, :availability, :capacity, :description, :equipment, :hourly_pricing, :location, :name, :rooms, :size
  has_attached_file :profile_picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  attr_accessible :profile_picture
  has_many :reviews

  geocoded_by :location
  after_validation :geocode

  scope :by_max_price, (lambda do |price|
    Space.where('hourly_pricing <= ?', price) unless price.nil?
  end)

  scope :by_services, (lambda do |services|
    Space.where(services: services) unless services.nil? or services.empty?
  end)

  scope :by_min_people, (lambda do |minimum|
    Space.where('space.capacity < num_people') unless minimum.nil?
  end)

end
