class TopicsController < ApplicationController

  def index
    @topics = Topic.all
     #render 'topics/index.html.erb'
  end

  def new
    @topic = Topic.new
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
    @topic = Topic.find(params[:id])
  end

    private
  #strong params
  def topic_params
    params.require(:topic).permit(:name, :timeline, :note)
  end


end
