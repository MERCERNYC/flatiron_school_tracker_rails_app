class SubjectsController < ApplicationController

  def new
    @topic = Topic.find(params[:topic_id])
    @subject = Subject.new
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @subject = @topic.subjects.build(subject_params)
    if @subject.save
      redirect_to topics_path
      # topics/:topic_id/subjects/:id
    else
      render "topics/show"
    end
  end


  private

  def subject_params
    params.require(:subject).permit(:name)
  end

end
