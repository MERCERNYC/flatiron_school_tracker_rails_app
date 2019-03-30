class SubjectsSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :topic
  delegate :student, to: :topic
end
