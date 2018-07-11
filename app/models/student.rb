class Student < ApplicationRecord
  has_many :labs
  has_many :topics, through: :labs
end
