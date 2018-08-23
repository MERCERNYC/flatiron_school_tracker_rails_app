  #join table
  class Subject < ActiveRecord::Base
    belongs_to :topic # foreign key - topic_id
    delegate :student, to: :topic # it is associated to the student only because it belongs to a topic, which belongs to a student

    #belongs_to :topics
    #belongs_to :student
  end
