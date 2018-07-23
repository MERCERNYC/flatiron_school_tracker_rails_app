class Student < ActiveRecord::Base
  has_many :subjects
  has_many :topics, through: :subjects

  has_secure_password

  validates :name, :presence => true
  validates :email, :uniqueness => true, format: /@/
  validates :password, presence: true

   #omniauth method

  # def self.find_or_create_by_omniauth(auth_hash)
  #   self.where(:email => auth_hash[:info][:email]).first_or_create do |student|# it will always create a instnce of users
  #     student.password = SecureRandom.hex
  #   end
  # end


end
