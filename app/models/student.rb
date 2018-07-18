class Student < ActiveRecord::Base
  has_secure_password

  #Validation
   # validates :name, presence: true
   # validates :password, presence: true, length: {minimum: 4}


  #Association
   has_many :topics
   has_many :subjects, through: :topics

   #add scope method used in view


end
