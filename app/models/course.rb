class Course < ApplicationRecord
  has_many :students
  has_many :courses through: :students

end
