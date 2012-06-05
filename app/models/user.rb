class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :location, :hide_location_from_search, :about
  attr_accessible  :profile_picture

  validates_presence_of :name
  
  has_many :personal_skills
  has_many :personal_styles
  has_many :skills, through: :personal_skills, dependent: :destroy
  has_many :styles, through: :personal_styles, dependent: :destroy
  
  accepts_nested_attributes_for :personal_skills
  accepts_nested_attributes_for :personal_styles

  acts_as_messageable
  geocoded_by :location
  has_attached_file :profile_picture, 
                    styles: { :medium => "300x300>", :thumb => "100x100>" }

  before_save :clear_location
  after_validation :geocode

  default_scope where(hide_location_from_search: false)

  def self.by_skills(skills)
    if skills.nil? or skills.empty?
      scoped
    else
      joins(:skills).
      where('skills.name'=> skills).
      group("users.id").
      having("COUNT(skills.id) >= ?", skills.length)
    end
  end

  def self.by_styles(styles)
    if styles.nil? or styles.empty?
      scoped
    else
      joins(:styles).
      where('styles.name'=> styles).
      group("users.id").
      having("COUNT(styles.id) >= ?", styles.length)
    end
  end


  def clear_location 
    if self.hide_location_from_search
      self.latitude = nil
      self.longitude = nil
    end
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
