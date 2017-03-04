class SessionsController < ApplicationController
  def new
  end

  def create
  	# pulls the user out of the database using the submitted email address. -budi
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		# Log the user in and redirect to the user's show page.
  		flash[:danger] = 'flash --> CORRECT email/password combination'
  		log_in user
  		redirect_to user
  	else
  		# Create an error message.
  		flash.now[:danger] = 'flash --> Invalid email/password combination' # Not quite right!
  		render 'new'
  	end
  end

  def destroy
  	log_out
  	redirect_to root_url
  end

  
end
