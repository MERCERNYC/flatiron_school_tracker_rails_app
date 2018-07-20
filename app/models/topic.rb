  class Topic < ActiveRecord::Base
    has_many :subjects #collection()
    has_many :students, through: :subjects

    validates :title, :presence => true



  # add cpmplete method to labs

    # def complete?
    #   # @topic = current_user.labs.find(params[:id])
    #   @topic.complete? == true
    #   @topic.save
    # end

  end
