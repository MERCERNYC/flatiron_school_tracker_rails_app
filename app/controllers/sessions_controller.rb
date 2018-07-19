class SessionsController < ApplicationController

  def new
  end

  def create
    @student = Student.find_by(email: params[:session][:email])
    if @student && @student.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to new_topic_path(@student)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end

    def destroy
     session.clear
     redirect_to login_path
    end

  end



end
