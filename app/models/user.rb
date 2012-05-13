class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :location
  
  has_many :personal_skills
  has_many :personal_styles
  has_many :skills, through: :personal_skills
  has_many :styles, through: :personal_styles

  has_attached_file :profile_picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  attr_accessible  :profile_picture

  acts_as_messageable

  geocoded_by :location
  after_validation :geocode

  scope :with_skills_and_styles, (lambda do
    User.includes(skills: :personal_skills).includes(styles: :personal_styles)
  end)

  scope :by_instruments, (lambda do |instruments|
    unless instruments.nil? or instruments.empty?
      User.joins(:skill).where(skill: instruments)
    end
  end)
  
  scope :by_styles, (lambda do |styles|
    unless styles.nil? or styles.empty?
      User.joins(:proficiencies).where(style: styles)
    end
#User.where('user.proficiencies.skill in ?', styles) unless styles.nil? or styles.empty?
  end)
end
