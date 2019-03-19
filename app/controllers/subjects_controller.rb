class SubjectsController < ApplicationController

  def new
    @topic = Topic.find(params[:topic_id])
    @subject = Subject.new
  end

  def show
    @subject = Topic.find(params[:topic_id]).subjects.find(params[:id])
    
  end

  def create
    @topic = Topic.find(params[:topic_id])# finding the parent
    @subject = @topic.subjects.build(subject_params)
    if @subject.save
      redirect_to topic_subject_path(@topic, @subject)
      # topics/:topic_id/subjects/:id
    else
      render "topics/show"
    end
  end


  private

  def subject_params
    params.require(:subject).permit(:name, :topic_id)
  end

end
