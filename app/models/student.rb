class Student < ActiveRecord::Base
  has_many :topics
  has_many :subjects, through: :topics

  has_secure_password

  validates :name, :presence => true
  validates :email, presence: true
  validates :email, :uniqueness => true
  validates :password, presence: true


end
