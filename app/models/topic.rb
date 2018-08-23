  class Topic < ActiveRecord::Base
    belongs_to :student
    has_many :subjects

    #has_many :subjects
    #has_many :students, through: ssubjects

    accepts_nested_attributes_for :subjects
    #This method tells Rails and ActiveRecord how to correctly deal with subjects_attributes being in the params hash.
    # scope :two_subjects_or_more, -> {)}

     def self.two_subjects_or_more
       self.select {|topic| topic.subjects.size > 2 }
     end

  end
