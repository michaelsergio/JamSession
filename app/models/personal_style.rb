class PersonalStyle < ActiveRecord::Base
  belongs_to :style
  belongs_to :user
end
