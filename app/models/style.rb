class Style < ActiveRecord::Base
  attr_accessible :name
  has_many :personal_styles
  has_many :users, through: :personal_styles
end
