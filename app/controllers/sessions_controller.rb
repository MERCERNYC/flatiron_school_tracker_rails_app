class SessionsController < ApplicationController

  def new
  end

  def create
    #Log in with OmniAuth path
    if auth
      @student = Student.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex
    end

    session[:student_id] = @student.id

    redirect_to @student

    else
    #normal login
    @student = Student.find_by(email: params[:session][:email])
    if @student && @student.authenticate(params[:session][:password])
    #log the user in and redirect to the user's create topic else give invalid login and require login
    session[:student_id] = @student.id
    flash[:success] = "Sucessfully logged in!"
    redirect_to @student
    else
    flash.now[:danger] = 'Invalid email/password combination'
    render :new
    end
   end
  end

  def destroy
    session[:student_id] = nil
     #was reset_session
    flash[:success] = "Sucessfully logged out!"
    redirect_to root_path
  end

  private

  def auth
     request.env['omniauth.auth']
   end

 end
