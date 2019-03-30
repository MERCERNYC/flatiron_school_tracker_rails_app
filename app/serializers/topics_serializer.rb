class TopicsSerializer < ActiveModel::Serializer
  attributes :id, :timeline, :title, :lab, :study_group 

  has_many :subjects

end
