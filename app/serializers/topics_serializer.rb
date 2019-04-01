class TopicsSerializer < ActiveModel::Serializer
  attributes :id, :timeline, :title, :lab, :study_group , :subjects

  belongs_to :student
  has_many :subjects


end
