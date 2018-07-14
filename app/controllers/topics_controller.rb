class TopicsController < ApplicationController
  before_action :set_topics, only: [:show, :edit, :update, :destroy]
  #actions will all have the set_topics method called before any other code in the action is run.

  def index
    @topics = Topic.all
     #render 'topics/index.html.erb'
  end

  def new

    @topic = Topic.new
    # raise @topic.inspect
    #render 'topics/new.html.erb'
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to @topic # topics/topic.id #topic_path(@topic)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @topic.update(timeline: params[:timeline], name: params[:name], note: params[:note])
    redirect_to @topic #topic_path(@topic)
  end

  private

  # method returns the @topic instance variable that each of the controller actions
  # will automatically have because of the before_action
  def set_topics
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:name, :timeline, :note)
  end


end
