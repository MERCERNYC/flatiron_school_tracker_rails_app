class TopicSerializer < ActiveModel::Serializer
  attributes :id, :timeline, :title, :lab, :study_group, :student_id

  belongs_to :student
  has_many :subjects

end
