class TopicsController < ApplicationController
  before_action :set_topics, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required, except:[:show]


  def index
    #if not logged_in you cant see topics
    @topics = current_user.topics
  end

  def new
    @topic = Topic.new
    # raise @topic.inspect
    #render 'topics/new.html.erb'
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      flash[:success] = "Topic was Sucessfully created!"
      redirect_to topics_path # /topics/#{@topic.id}
    else
      render :new
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
    params.require(:topic).permit(:timeline, :title, :lab, :study_group, subjects_attributes: [:id, :description, :_destroy])
  end

end
