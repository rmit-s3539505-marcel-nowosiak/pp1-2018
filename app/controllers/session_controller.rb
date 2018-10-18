class SessionsController < ApplicationController
    
def create
    if user = User.authenticate(params[:email], params[:password])
      # Save the user ID in the session so it can be used in
      # subsequent requests
      session[:current_user_id] = user.id
      redirect_to root_url
    end
end

private
def login_params
    params.require(:login).permit(:email, :password)
end

def login
    @login = "test"
end



end
