class TopicsController < ApplicationController
  before_action :set_topics, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required, only: [:show, :edit, :update, :destroy]

  def index
    #if not logged_in you cant see topics
    @topics = current_user.topic
  end

  def new
    # @topic = Topic.new
    #returns Student object if it is found or nil if it is not.
    @student = Student.find(params[:student_id])
    raise params.inspect
    @topic = Topic.new
  end

  def create
    # @topic = current_user.topics.new(topic_params)
    @student = Student.find(params[:student_id])
    @topic = Topic.new(topic_params)
    @topic.student = @student
    if @topic.save
      flash[:success] = "Topic was Sucessfully created!"
      redirect_to topics_path # /topics/#{@topic.id}
    else
      render :'topics/new'
    end
  end

  def show
     # @topic = Topic.find(params[:id])
  end

  def edit
    # @topic = Topic.find(params[:id])
  end

  def update
    if @topic.update(topic_params)
      redirect_to topics_path
    else
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    flash[:success] = "Sucessfully Deleted Topic!"
    redirect_to topics_path
  end

  private

  # method returns the @topic instance variable that each of the controller actions
  # will automatically have because of the before_action
  def set_topics
    @topic = Topic.find(params[:id])
  end


  def topic_params
    params.require(:topic).permit(:timeline, :title, :lab, :study_group)
  end

end
