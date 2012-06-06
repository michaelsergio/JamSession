class Skill < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of :name

  has_many :personal_skills
  has_many :users, through: :personal_skills

  before_create :normalize_name

  def normalize_name
    self.name = self.name.titleize.strip
  end
end
