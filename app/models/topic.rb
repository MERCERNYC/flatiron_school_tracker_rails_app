  class Topic < ActiveRecord::Base
    has_many :subjects #collection()
    has_many :students, through: :subjects

    validates :timeline, :title, :lab,  :presence => true


  end
