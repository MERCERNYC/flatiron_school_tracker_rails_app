class Student < ApplicationRecord
  has_many :courses
  has_many :labs through: :courses
end
