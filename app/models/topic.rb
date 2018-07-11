class Topic < ActiveRecord::Base
  has_many :labs
  has_many :students, through: :labs
end
