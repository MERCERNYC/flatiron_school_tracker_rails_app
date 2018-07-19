class Student < ActiveRecord::Base
  has_many :topics
  has_many :subjects, through: :topics

  has_secure_password
  #added field_with_errors to scss file. THE OBJECT F SEES that email property that students has errors and surronds it with field_with errors
  validates :name, :presence => true
  validates :email, :uniqueness => true
  validates :password, presence: true

   #add scope method used in view


end
