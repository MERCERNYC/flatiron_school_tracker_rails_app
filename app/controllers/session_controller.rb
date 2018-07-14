class SessionController < ApplicationController

  def new
    @students = Student.new
  end

  def create
    @student = Student.find_by(name: params[:student][:name])
    if @student && @student.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to student_path(@student)
    else
      render :new
    end

  end



end
