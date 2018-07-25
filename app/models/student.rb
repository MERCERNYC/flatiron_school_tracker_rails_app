class Student < ActiveRecord::Base
  has_many :subjects
  has_many :topics, through: :subjects

  has_secure_password

  validates :name, :presence => true
  validates :email, presence: true
  validates :email, :uniqueness => true
  validates :password, presence: true

  #Logged in via OAuth - find if logged in via GitHub before, otherwise create
  #first_or_create creates a new record if none is found in DB,an dwhen creating it use params used set up like email
  # def self.find_or_create_by_omniauth(auth_hash)
  #   where(:email => auth_hash['info']['email']).first_or_create do |student|
  #     student.name = auth_hash['info']['name']
  #     student.password = SecureRandom.hex(10)
  #   end
  # end


end
