class TopicsSerializer < ActiveModel::Serializer
  attributes :id, :timeline, :title, :lab, :study_group, :student_id

  has_many :subjects
  # belongs_to :student, serializer: StudentSerializer
end
