class Skill < ActiveRecord::Base
  attr_accessible :name
  has_many :personal_skills
  has_many :users, through: :personal_skills

  before_create :normalize_name

  def normalize_name
    self.name = self.name.titleize
  end
end
