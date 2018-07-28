class SubjetcsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @subject = @topic.subjects.build(subject_params)
    if @subject.save
      redirect_to topic_path(@topic)
    else
      render "topics/show"
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end

end
