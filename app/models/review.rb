class Review < ActiveRecord::Base
  belongs_to :posted_by
  belongs_to :space

  attr_accessible :detail, :rating
end
