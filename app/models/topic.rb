  class Topic < ActiveRecord::Base
    belongs_to :student
    has_many :subjects #collection()
    has_many :students, through: :subjects

    validates :timeline, :title, :lab,  :presence => true


  end
