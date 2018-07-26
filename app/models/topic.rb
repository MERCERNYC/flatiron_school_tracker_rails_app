  class Topic < ActiveRecord::Base
    belongs_to :student
    has_many :subjects, through: :topics

    validates :timeline, :title, :lab,  :presence => true


  end
