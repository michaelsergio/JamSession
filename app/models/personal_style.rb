class PersonalStyle < ActiveRecord::Base
  belongs_to :style
  belongs_to :user

  attr_accessible :style, :user
end
