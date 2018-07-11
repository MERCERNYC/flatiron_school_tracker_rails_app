#join table
class Lab < ApplicationRecord
  belongs_to :course
  belongs_to :lab
end
