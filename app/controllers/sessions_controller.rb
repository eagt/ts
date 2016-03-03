class SessionsController < ApplicationController
  
  def new
  end

   def create
    user = User.find_by(email: params[:session][:email].downcase)
    # /**  This code will allow users to log in only in they've activated their account **/

    if user && user.authenticate(params[:session][:password])
           if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

#  /* --- This three including the one above can be put in only one  block to be used by all of them using the object. thing

#    def create
#     company = Company.find_by(email: params[:session][:email].downcase)
#     if company && company.authenticate(params[:session][:password])
#       # Log the user in and redirect to the user's show page.
#     else
#       # Create an error message.
#       flash.now[:danger] = 'Invalid email/password combination'
#       render 'new'
#     end
#   end


#    def create
#     professional =  Professional.find_by(email: params[:session][:email].downcase)
#     if  professional  &&  professional .authenticate(params[:session][:password])
#       # Log the user in and redirect to the user's show page.
#     else
#       # Create an error message.
#       flash.now[:danger] = 'Invalid email/password combination'
#       render 'new'
#     end
#   end

  
# /* -----
 def destroy
    log_out if logged_in?
    redirect_to root_url   # I will make a page where change the welcome page for other that says Good bye and come back soon
  end
end
