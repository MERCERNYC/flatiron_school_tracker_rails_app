  #join table
  class Subject < ActiveRecord::Base
    belongs_to :topic #adds methods to the model
    belongs_to :student

    validates :description, :presence => true

    def complete?
      @subject = current_user.subjects.find(params[:id])
      @subject.completed = true
      @subject.save
      redirect_to subjects_path
    end

  end
