class SubjetcsController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id]) # finding the parent
    @subject = @subject.topics.build(subject_params)
    if @subject.save
      redirect_to topic_path(@topic)
    else
      # render "subjects/show"
    end
  end

  private

  def subject_params
    params.require(:subject).permit(:name )
  end

end
