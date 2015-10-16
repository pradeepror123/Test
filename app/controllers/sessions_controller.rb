class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username(params[:username])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id

      path = if user.doctor?
        doctors_root_path
      elsif user.receptionist?
        receptionists_root_path
      else
        patients_root_path
      end

      STDERR.puts ">>>>>#{path}"

      redirect_to path 

    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
