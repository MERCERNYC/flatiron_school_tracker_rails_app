  #join table
  class Subject < ActiveRecord::Base
    belongs_to :topic
    belongs_to :student
  end
end
