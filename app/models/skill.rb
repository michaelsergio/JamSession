class Skill < ActiveRecord::Base
  attr_accessible :name
  has_many :personal_skills
  has_many :users, through: :personal_skills
end
