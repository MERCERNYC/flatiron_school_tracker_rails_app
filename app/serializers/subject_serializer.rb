class SubjectSerializer < ActiveModel::Serializer
  attributes :id , :name, :topic_id

  belongs_to :topic
  delegate :student, to: :topic
end
