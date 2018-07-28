class TopicsController < ApplicationController
  before_action :set_topics, only: [:show, :edit, :update, :destroy]

  def index
    #if not logged_in you cant see topics
    if logged_in?
      @topics = current_user.topics
     else
      flash[:notice] = "Please Login to see Topics"
      redirect_to login_path
    end
  end

  def new
    @topic = Topic.new
	  4.times do
    @topic.subjects.build
   end
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      flash[:success] = "Topic was Sucessfully created!"
      redirect_to topics_path # /topics/#{@topic.id}
    else
      render :'topics/new'
    end
  end

  #scope method
  def two_or_more
    @topics = Topic.two_subjects_or_more
  end

  def show
     # @topic = Topic.find(params[:id])
  end

  def edit
    # @topic = Topic.find(params[:id])
    if authorized_to_edit?
    # session[:student_id] = @student.id
      redirect_to 'topics/edit'
    else
      flash[:notice] = "Not authorized please Log In!"
      redirect_to login_path
    end
  end

  def update
    if authorized_to_edit?
      @topic.update(topic_params)
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
    params.require(:topic).permit(:timeline, :title, :lab, :study_group, :student_id, :subjects_attributes => {})
  end

end
