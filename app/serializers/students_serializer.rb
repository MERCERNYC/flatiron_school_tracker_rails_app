class StudentsSerializer < ActiveModel::Serializer
  attributes :id

  has_many :topics
  has_many :subjects, through: :topics
end
