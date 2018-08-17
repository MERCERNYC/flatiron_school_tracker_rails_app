class SubjectsController < ApplicationController

  def new
    @topic = Topic.find(params[:topic_id])
    @subject = Subject.new
  end


  def show
    # @subject = @topic.subjects.find_by(id: params[:id])
      @subject = Subject.all
  end

  def create
    @topic = Topic.find(params[:topic_id])# finding the parent
    @subject = @topic.subjects.build(subject_params)
    if @subject.save
      redirect_to topic_subject_path(@topic)
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
