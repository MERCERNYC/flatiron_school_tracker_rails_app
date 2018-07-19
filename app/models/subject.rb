  #join table
  class Subject < ActiveRecord::Base
    belongs_to :topic #adds methods to the model
    belongs_to :student

    validates :description, :presence => true

  end
