class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :topics
  has_many :subjects, through: :topics
end
