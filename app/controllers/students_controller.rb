class StudentsController < ApplicationController

  #here we restrict the filter to act only on the :edit and
  #:update actions by passing the appropriate only: options hash

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "Welcome to the App!"
      redirect_to @student # students/student.id #student_path(@student )
    else
      render :new #show them the form
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :password)
  end
end
