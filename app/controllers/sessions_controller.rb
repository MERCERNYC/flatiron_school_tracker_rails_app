class SessionsController < ApplicationController

  def new
  end

  def create

    # @student = Student.find_or_create_by(uid: auth['uid']) do |u|
    #   raise params.inspect
    #
    #   u.name = auth['info']['name']
    #   u.email = auth['info']['email']
    # end
    #
    # session[:student_id] = @student.id
    # # if auth_hash = request.env['omniauth.auth'] #if this is present sign to local variable
    # #   @student = Student.find_or_create_by_omniauth(auth_hash)
    # #   session[:student_id] = @student.id
    # #
    # #   redirect_to new_topic_path(@student)
    #
    # else
      #normal login
      @student = Student.find_by(email: params[:session][:email])
      if @student && @student.authenticate(params[:session][:password])
      #log the user in and redirect to the user's create topic else give invalid login and require login
      session[:student_id] = @student.id
      flash[:success] = "Sucessfully logged in!"
      redirect_to new_topic_path(@student)
      else
      flash.now[:danger] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    reset_session
    flash[:success] = "Sucessfully logged out!"
    redirect_to root_path
  end

 end
