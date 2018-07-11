class Topic < ApplicationRecord
  has_many :labs
  has_many :students, through: :labs
end
