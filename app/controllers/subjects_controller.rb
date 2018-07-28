class SubjetcsController < ApplicationController

  def new
    @subject = Subject.new
    @subject.topics.build
   end
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:success] = "Subject was sucessfully created!"
      redirect_to topic_path(@topic)
    else
      flash[:success] = "Unable to create subject!"
      redirect_to topic_path(@topic)
    end
  end

  def destroy
    @subject.destroy
    flash[:success] = "Subject Deleted!"
    redirect_to topics_path(@topic)
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end

end
