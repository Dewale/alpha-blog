class SessionsController < ApplicationController
    def new
    
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            #Cookies for session hash
            session[:user_id] = user.id
            flash[:success] = 'Login successful'
            redirect_to user_path(user)
        else
            flash.now[:danger] = 'Error with login information'
            render 'new'
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:success] = 'You have been logged out'
        redirect_to root_path
    end

end
