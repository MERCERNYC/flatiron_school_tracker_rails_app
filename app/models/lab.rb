#join table
class Lab < ActiveRecord::Base
  belongs_to :course
  belongs_to :lab
end
