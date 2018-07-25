  #join table
  class Subject < ActiveRecord::Base
    belongs_to :topic #adds methods to the model
    belongs_to :student

  #scope topic/subject/working_on
  #a subject can be marked as working, stuck, done

  def working_on

  end

  def stuck

  end

  def done

  end



  end
