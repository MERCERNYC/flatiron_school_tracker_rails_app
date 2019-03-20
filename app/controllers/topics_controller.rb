class TopicsController < ApplicationController
  #Filters are inherited, so if you set a filter on ApplicationController, it will be run on every controller in your application.
  before_action :authorized_to_edit?, only: [:edit, :update]
  before_action :set_topics, only: [:show, :edit, :update, :destroy]

  def index
    #if not logged_in you cant see topics
     if logged_in?
      @topics = current_user.topics
    else
      flash[:danger] = "Please sign up or login to see topics."
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
     respond_to do |format|
      format.html { render :show }
      format.json { render json: @topic.to_json}
      end
  end

  def edits
    # @topic = Topic.find(params[:id])
  end

  def update
    @topic.update(topic_params)
    redirect_to topics_path
  end

  def destroy
    @topic.destroy
    flash[:success] = "Sucessfully Deleted Topic!"
    redirect_to topics_path
  end

  private

  def set_topics
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:timeline, :title, :lab, :study_group, :student_id, :subjects_attributes => {})
  end

end
