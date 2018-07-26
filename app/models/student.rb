class Student < ActiveRecord::Base
  has_many :subjects
  has_many :topics, through: :subjects

  has_secure_password

  validates :name, :presence => true
  validates :email, presence: true
  validates :email, :uniqueness => true
  validates :password, presence: true


end
