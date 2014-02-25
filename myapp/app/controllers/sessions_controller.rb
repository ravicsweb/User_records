class SessionsController < ApplicationController
  def new
  end
  
  def create
    @email = params[:email]
    user = User.find_by_email(@email)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      session[:user_email] = @email
      redirect_to root_path, :notice => "Signed in as #{@email}."
    else
      flash[:notice] = 'Sign-in unsuccessful.'
      render 'new'
    end
  end
  
  def destroy
    reset_session
    redirect_to root_url
  end
end