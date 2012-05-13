class PersonalSkill < ActiveRecord::Base
  belongs_to :skill
  belongs_to :user
  attr_accessible :expertise_level, :years_of_experience
end
