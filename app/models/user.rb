class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :location, :hide_location_from_search, :about

  has_attached_file :profile_picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
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
  after_validation :geocode
  before_save :clear_location

  def clear_location 
    if self.hide_location_from_search
      self.latitude = nil
      self.longitude = nil
    end
  end

  def oh_god
    a = %{ SELECT * FROM users, personal_skills, skills 
           WHERE users.id = personal_skills.user_id 
           AND personal_skills.skill_id = skills.id }
    b= ActiveRecord::Base.connection.execute(a)

  end
  scope :with_skills_and_styles, (lambda do |skills, styles|
#by_skills(skills).merge(by_styles(styles)) 
  end)

  def self.by_skills(skills)
    unless skills.nil? or skills.empty?
      scoped = includes(:skills)
      skills.each do |skill|
        scoped.merge(where('skills.name' => skill))
      end
    end
  end

  def self.by_styles(styles)
    includes(:styles).where('styles.name'=> styles) unless styles.nil? or styles.empty?
  end

  scope :nearby_with_skills_and_styles, (lambda do |skills, styles, location, miles|
      #TODO currently broken
      near(location, miles).merge(with_skills_and_styles(skills, styles))
  end)

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
