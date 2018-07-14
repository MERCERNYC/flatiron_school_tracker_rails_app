class TopicsController < ApplicationController

  def new
    @topics = Topic.new
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

  # def update
  #   @post = Post.find(params[:id])
  #   @post.update(post_params)
  #   redirect_to post_path(@post)
  # end

    private
  #strong params
  def topic_params
    params.require(:topic).permit(:name, :timeline, :note)
  end


end
