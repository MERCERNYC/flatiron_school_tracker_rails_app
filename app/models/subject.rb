  #join table
  class Subject < ActiveRecord::Base
    belongs_to :topic #adds methods to the model
    # belongs_to :student
    delegate :student, to: :topic # it is associated to the student only because it belongs to a topic, which belongs to a student
  end
