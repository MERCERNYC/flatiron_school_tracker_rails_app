class SubjetcsController < ApplicationController
  before_action :load_topic

  def index
    @subjects = @topic.subjects.all
  end

  def new
    @subject = Subject.new
    @subjects = @topic.subjects.new
  end

  def create
    @subject = @topic.subjects.new(subject_params)
    if @subject.save
      flash[:success] = "Subject was sucessfully created!"
      redirect_to topic_path(@topic)
    else
      flash[:success] = "Unable to create subject!"
      redirect_to topic_path(@topic)
    end
  end

  def destroy
    @subject = @topic.subjects.find[params[:id]]
    @subject.destroy
    flash[:success] = "Subject Deleted!"
    redirect_to topics_path(@topic)
  end

  private

  def load_topic
    @topic = Topic.find(params[topic_id])
  end

  def subject_params
    params.require(:subject).permit(:description)
  end

end
