class StudentsController < ApplicationController

  def index
     @students = Student.all
     respond_to do |format|
      format.html { render :index }
      format.json { render json: @students.to_json}
      end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:success] = "Welcome to the App!"
      session[:student_id] = @student.id
      redirect_to @student# students/student.id #student_path(@student )
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
