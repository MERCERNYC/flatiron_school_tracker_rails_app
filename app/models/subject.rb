  #join table
  class Subject < ActiveRecord::Base
    belongs_to :topic #adds methods to the model
    delegate :student, to: :topic # it is associated to the student only because it belongs to a topic, which belongs to a student

  #scope topic/subject/working_on
  #a subject can be marked as working, stuck, done

  # def self.complete
  #
  # end
  #
  # def self.
  #
  # end


  end
