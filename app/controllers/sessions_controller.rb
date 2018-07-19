class SessionsController < ApplicationController

  def new
  end

  def create
    @student = Student.find_by(name: params[:nane])
    if @student && @student.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to new_topic_path(@student)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
