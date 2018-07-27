  class Topic < ActiveRecord::Base
    belongs_to :student
    has_many :subjects

    validates :timeline, :title, :lab,  :presence => true
    accepts_nested_attributes_for :subjects


  end
