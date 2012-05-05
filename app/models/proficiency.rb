class Proficiency < ActiveRecord::Base
  attr_accessible :expertise_level, :skill, :years_of_experience
  belongs_to :user
end
